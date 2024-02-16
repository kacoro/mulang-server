import { Resource } from "../entities/Resource";
import { Resolver, Query, Arg, Int, Mutation, InputType, Field, Ctx, UseMiddleware, FieldResolver, Root, ObjectType } from "type-graphql";
import { MyContext } from "../types";
import { isAuth } from "../middleware/isAuth";
import {AppDataSource} from "../index"
import PaginatedResponse from "../types/PaginatedResponseClass";
import fs from 'fs'
import path from 'path'
import { Like } from "typeorm";
@InputType()
class ResourceInput {
    @Field()
    title: string

    @Field()
    url:string
    
    @Field()
    text: string
}

@ObjectType()
class PaginatedUserResponse extends PaginatedResponse(Resource) {
  // we can freely add more fields or overwrite the existing one's types
//   @Field(type => [String])
//   otherInfo: string[];
}

@Resolver(Resource)
export class ResourceResolver {

    @FieldResolver(() => String)
    creator(
        @Root() res: Resource,
        @Ctx() {loaders}:MyContext
    ) {
        // return User.findOne(post.creatorId)
       return loaders.UserLoader.load(res.creatorId)
    }    

    @FieldResolver(() => String)
    uploadType(
        @Root() res: Resource,
    ) {
        let types = res.mimetype.split("/")
        return types[0]||res.mimetype;
    }    

    @Query(() => PaginatedUserResponse) // ()=> [Post]
    async resources(
        @Arg('limit', () => Int,{ nullable: true }) limit: number=20,
        @Arg('page', () => Int,{ nullable: true }) page: number =1,
        @Arg('groupId', () => Int,{ nullable: true }) groupId: number,
        @Arg('type', () => String,{ nullable: true }) type: string
    ): Promise<PaginatedUserResponse> { //: Promise<Post[]>
        // 20->21
        const realLimit = Math.min(50, limit);
        //const realLimitPlusOne = realLimit + 1
        let offset = (page - 1) * realLimit;
        let total = 0;
        const qb = AppDataSource.getRepository(Resource).createQueryBuilder("resource")
       
        let condition ={}
        if(groupId){
            condition = Object.assign(condition,{groupId})
            //qb.where({groupId:groupId})
        }
        if(type){
            condition = Object.assign(condition,{mimetype:Like(`%${type}%`)})
            
            
        }
        qb.where(condition)
        total = await qb.getCount()
            // .innerJoinAndSelect("p.creator", "u", 'u.id = p.creatorId')
           // qb.orderBy("p.createdAt", "DESC").take(realLimitPlusOne)
           qb.take(realLimit)
           qb.skip(offset)
        const res = await qb.getMany()
       
        let totalPage = Math.ceil((total) / realLimit);
        // console.log(total, realLimit, totalPage)
        let hasMore = page < totalPage
        return {
            page,
            limit,
            hasMore,total,totalPage,
            items:res
            
        };
    }

    @Query(() => Resource, { nullable: true })
    resource(
        @Arg('id', () => Int) id: number,
    ): Promise<Resource | null> {
        // return Post.findOne(id, { relations: ["creator"] });
        return Resource.findOneBy({id});
    }

    @Mutation(() => Resource)
    @UseMiddleware(isAuth)
    async createResource(
        @Arg("input") input: ResourceInput,
        @Ctx() { req }: MyContext
    ): Promise<Resource> {
        return await Resource.create({ ...input, creatorId: req.session.userId }).save()
    }
    

    @Mutation(() => Resource, { nullable: true })
    @UseMiddleware(isAuth)
    async updateResource(
        @Arg("id", () => Int) id: number,
        @Arg("title") title: string,
        @Ctx() { req }: MyContext
    ): Promise<Resource | null> {

        const result = await Resource.update({
            id,
            creatorId: req.session.userId
        }, { title })
        if (result.affected) {
            const post = await Resource.findOneBy({id})
            if (post) {
                return post
            }
        }

        return null;
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteResource(
        @Arg("id", () => Int) id: number,
        // @Ctx() { req }: MyContext
    ): Promise<boolean> {
       
        let res = await Resource.findOneBy({id})
        
        if(res){
            const pathName = path.join(__dirname, "../../public",res.url)
            try {
                await fs.unlinkSync(pathName)
                // await Resource.delete({ id, creatorId: req.session.userId })
                await Resource.delete({ id})
                return true;
                //file removed
              } catch(err) {

                console.log("error",err)
                await Resource.delete({ id})
                return false;
              }
        }
        console.log(res)
        //删除服务器的文件
        // await Resource.delete({ id, creatorId: req.session.userId })
        
        return true;
    }
}