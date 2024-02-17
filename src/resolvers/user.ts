
import { MyContext } from "../types";
import { Resolver, Ctx, Arg, Mutation, Field, ObjectType, Query, FieldResolver, Root, UseMiddleware } from "type-graphql";
import { User } from "../entities/User";
import argon2 from 'argon2'
import { sendEmail } from "../utils/sendEmail";
import { UsernamePasswordInput } from "../types/UsernamePasswordInput";
import { validateRegister } from "../utils/validateRegister";
import { v4 } from 'uuid'
import { FOGET_PASSWORD_PREFIX } from "../constants";
import { isAuth } from "../middleware/isAuth";
import { decodeToken, generateToken, removeTokenFromBlacklist } from "../utils/jwt";



@ObjectType()
class FieldError {
    @Field()
    field: string;

    @Field()
    message: string
}

@ObjectType()
class UserResponse {
    @Field(() => [FieldError], { nullable: true })
    errors?: FieldError[]

    @Field(() => User, { nullable: true })
    user?: User;

    @Field()
    token?:String 
}




@Resolver(User)
export class UserResolver {
    @FieldResolver(() => String)
    email(@Root() user: User, @Ctx() { payload }: MyContext) {
        if (payload.sub === user.id) {//this is the current user and its ok to show them their own email
            return user.email;
        }
        // current user wants to see someone else email
        return "";
    }
    @Mutation(() => UserResponse)
    @UseMiddleware(isAuth)
    async resetPassword(
        @Arg('oldPassword') oldPassword: string,
        @Arg('newPassword') newPassword: string,
        @Ctx() {  payload }: MyContext
    ): Promise<UserResponse> {
        if(oldPassword==newPassword){
            return {
                errors: [{
                    field: "newPassword",
                    message: "新旧密码是一样的，不能执行此操作"
                }]
            } 
        }
        if (newPassword.length <= 3) {
            return {
                errors: [{
                    field: "newPassword",
                    message: "length must be greater than 3"
                }]
            }
        }

        const userId = payload.sub
        if (!userId) {
            return {
                errors: [{
                    field: "token",
                    message: "token expired"
                }]
            }
        }
       
        const user = await User.findOneBy({ id: userId });
        if (!user) {
            return {
                errors: [{
                    field: "token",
                    message: "user no longer exists"
                }]
            }
        }
        const {password} = user
       
        let valid =  await argon2.verify(password, oldPassword);
     
        if(!valid){
            return {
                errors: [{
                    field: "oldPassword",
                    message: "密码不正确"
                }]
            } 
        }
        const hashNewPassword = await argon2.hash(newPassword)
      
        User.update({ id: userId }, { password: hashNewPassword })

        return { user }
    }
    @Mutation(() => UserResponse)
   
    async changePassword(
        @Arg('token') token: string,
        @Arg('newpassword') newpassword: string,
        @Ctx() { redis }: MyContext
    ): Promise<UserResponse> {
        if (newpassword.length <= 3) {
            return {
                errors: [{
                    field: "newpassword",
                    message: "length must be greater than 3"
                }]
            }
        }

        const key = FOGET_PASSWORD_PREFIX + token
        const userId = await redis.get(key)
        if (!userId) {
            return {
                errors: [{
                    field: "token",
                    message: "token expired"
                }]
            }
        }
        const userIdNum = parseInt(userId)
        const user =  await User.findOneBy({ id: userIdNum });
        if (!user) {
            return {
                errors: [{
                    field: "token",
                    message: "user no longer exists"
                }]
            }
        }
        User.update({ id: userIdNum }, { password: await argon2.hash(newpassword) })

        await redis.del(key)
        //最好刷新jwt，并且将旧的token加入黑名单
        // console.log(user.id)
        // req.session.userId = user.id
        // console.log(req.session.userId)
        return { user }
    }


    @Mutation(() => Boolean)
    async forgotPassword(
        @Arg('email') email: string,
        @Ctx() { redis }: MyContext
    ) {
        if (!email.includes('@')) {
            return false;
        }
        const user = await User.findOne({ where: { email } });
        if (!user) {
            //the email is not in the db
            return false;
        }
        const token = v4();
        await redis.set(FOGET_PASSWORD_PREFIX + token, user.id, 'EX', 1000 * 60 * 60 * 24 * 3) //3 days
        sendEmail(email,
            `<a href=${process.env.CORS_ORIGIN}"/change-paasword/${token}">reset password</a>`
        );
        return true;
    }


    @Query(() => User, { nullable: true })
    async me(
        @Ctx() { payload }: MyContext
    ) {
        if (!payload) {
            return null
        }
        return await User.findOneBy({id:payload.sub})
    }

    @UseMiddleware(isAuth) //禁止前台注册
    @Mutation(() => UserResponse)
    async register(
        @Arg('options') options: UsernamePasswordInput,
        @Ctx() {  }: MyContext
    ): Promise<UserResponse> {
        const errors = validateRegister(options)
        if (errors) {
            return { errors }
        }
        const hashedPassword = await argon2.hash(options.password)

        try {
            const user = await User.create({
                username: options.username,
                email: options.email,
                password: hashedPassword
            }).save()
            //注册的时候可以生成jwt。无需再次登录
            // const user = new User();
            // user.username = options.username;
            // user.email = options.email;
            // user.password = hashedPassword;
            // await user.save();
            // req.session.userId = user.id;
            return { user };
        } catch (error) {
            let message = "error.code:" + error.code
            let field = ""
            if (error.code === 'ER_DUP_ENTRY') {
                // user_email_unique

                let colomn = error.sqlMessage.split(" ")[5].split("_")[1]
                message = colomn + " already exists"
                field = colomn
            }
            return {
                errors: [{
                    field: field,
                    message: message
                }]
            }
        }


    }

    @Mutation(() => UserResponse)
    async login(
        @Arg('usernameOrEmail') usernameOrEmail: string,
        @Arg('password') password: string,
        @Ctx() {  }: MyContext
    ): Promise<UserResponse> {
        const user = await User.findOne({
            where: usernameOrEmail.includes('@') ?
                { email: usernameOrEmail }
                : { username: usernameOrEmail }
        })

        if (!user) {
            return {
                errors: [{
                    field: "usernameOrEmail",
                    message: "that username or email doesn't exist"
                }]
            }
        }
        const valid = await argon2.verify(user.password, password);
        if (!valid) {
            return {
                errors: [{
                    field: "password",
                    message: "incorrect password"
                }]
            }
        }

        // stoe userId
        // req.session.userId = user.id;
        const token = generateToken({sub:user.id,name:user.username,iat: Math.floor(Date.now() / 1000)});
        return { user ,token};
    }

    @Mutation(() => Boolean)
    async logout(
        @Ctx() { req, res }: MyContext
    ) {

        // return new Promise(resolve => req.session.destroy((err: any) => {
        //     res.clearCookie("qid")
        //     if (err) {
        //         console.log(err)
        //         resolve(false)
        //         return
        //     }
        //     resolve(true)

        // }))
        return new Promise(resolve => {
            if(req.headers.authorization) {
                const token = req.headers.authorization.split(' ')[1]; // 提取 token
                removeTokenFromBlacklist(token); // 删除或撤销 token
             }
            res.clearCookie('token'); // 清除 cookie 中的 token
            resolve(true)
        })
       
    }

   

    /*
        refreshToken 什么时候需要刷新token？手动刷新
        也可以在中间件中使用
        签证快过期的时候。客户端验证时间，快结束时使用
    */
    @Mutation(() => UserResponse)
    @UseMiddleware(isAuth)
    refreshToken(
        // @Arg('oldToken') oldToken: string,
        @Ctx() {token }: MyContext
    ) {
        let oldToken = token || ""
        try {
            const payload = decodeToken(oldToken); // 验证当前 token
            const newToken = generateToken(payload); // 生成新的 token
            return { token: newToken,errors: [{
                field: "token",
                message: "Token refreshed successfully."
            }] };
          } catch (error) {
            throw new Error('Invalid token.');
          }
    }

}