import { Resource } from "../entities/Resource";
import { Resolver, Query, Arg, Int, Mutation, InputType, Field, Ctx, UseMiddleware, FieldResolver, Root } from "type-graphql";
import { MyContext } from "../types";
import { isAuth } from "../middleware/isAuth";
import { getConnection } from "typeorm";

@InputType()
class ResourceInput {
    @Field()
    title: string

    @Field()
    url:string
    
    @Field()
    text: string
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


    @Query(() => Resource) // ()=> [Post]
    async resources(
        @Arg('limit', () => Int) limit: number,
        @Arg('cursor', () => Int, { nullable: true }) cursor: number | null,
        @Ctx() { req }: MyContext
    ): Promise<Resource[]> { //: Promise<Post[]>
        // 20->21
        const realLimit = Math.min(50, limit);
        const realLimitPlusOne = realLimit + 1

        const replacements: any[] = [realLimitPlusOne, req.session.userId]

        if (cursor) {
            const parseCurrsor = cursor
            replacements.push(parseCurrsor)
        }

        const qb = getConnection().getRepository(Resource).createQueryBuilder("p")
            // .innerJoinAndSelect("p.creator", "u", 'u.id = p.creatorId')
            .orderBy("p.createdAt", "DESC").take(realLimitPlusOne)

        if (cursor) {
            qb.skip(cursor)
            // qb.where("p.createdAt < :cursor", {
            //     cursor: new Date(parseInt(cursor))
            // })
        }
        const res = await qb.getMany()

        return res;
    }

    @Query(() => Resource, { nullable: true })
    resource(
        @Arg('id', () => Int) id: number,
    ): Promise<Resource | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        return Resource.findOne(id);
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
            const post = await Resource.findOne(id)
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
        @Ctx() { req }: MyContext
    ): Promise<boolean> {
        await Resource.delete({ id, creatorId: req.session.userId })
        return true;
    }
}