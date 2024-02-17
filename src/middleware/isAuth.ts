import { User } from '../entities/User'
import { MyContext } from '../types'
import { MiddlewareFn } from 'type-graphql'
// import { verifyJwt } from '../utils/jwt'
export const isAuth: MiddlewareFn<MyContext> = async ({ context }, next) => {
    // console.log("context.req.session.",context.req.session.userId)
    // context.req.session.userId = 1
    // const token = context.req.headers.authorization || '';
    // let payload = verifyJwt(token.replace('Bearer ', ''));
    let payload = context.payload
    // console.log(payload)
    if (!payload) {
        console.log('not authenticated', context.payload)
        throw new Error('not authenticated')
    }
     const user = await User.findOneBy({ id: payload.sub });
     if (!user) {
         throw new Error('not authenticated')
     }
    return next();
}