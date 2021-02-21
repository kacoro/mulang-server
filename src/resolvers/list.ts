import { List } from "../entities/List";
import { Resolver, Query, Arg, Int, Mutation, InputType, Field, Ctx, UseMiddleware, FieldResolver, Root, ObjectType } from "type-graphql";
import { MyContext } from "../types";
import { isAuth } from "../middleware/isAuth";
import { getConnection } from "typeorm";

@InputType()
class PostInput {
    @Field()
    title: string
    @Field()
    text: string
}

@ObjectType()
class PaginatedPosts {
    @Field(() => [List])
    rows: List[]
    @Field()
    hasMore: boolean;
}



@Resolver(List)
export class PostResolver {
    @FieldResolver(() => String)
    textSnippet(
        @Root() root: List
    ) {
        return root.text.slice(0, 50)
    }

    @FieldResolver(() => String)
    creator(
        @Root() post: List,
        @Ctx() {loaders}:MyContext
    ) {
        // return User.findOne(post.creatorId)
       return loaders.UserLoader.load(post.creatorId)
    }    

    @FieldResolver(() => Int, { nullable: true })
    async voteStatus(
        @Root() root: List,
        @Ctx() {loaders,req}:MyContext
    ) {
        // console.log(root.updoots)
        // // root.updoots
        // if (root.updoots) {
        //     return root.updoots[0]?.value
        // } else {
        //     return null
        // }
        if(!req.session.userId){
            return null
        }
        const updoot = await loaders.UpdootLoader.load({postId:root.id,userId:req.session.userId})
        return updoot ?updoot.value:null
    }

   

    @Query(() => PaginatedPosts) // ()=> [Post]
    async posts(
        @Arg('limit', () => Int) limit: number,
        @Arg('cursor', () => String, { nullable: true }) cursor: string | null,
        @Ctx() { req }: MyContext
    ): Promise<PaginatedPosts> { //: Promise<Post[]>
        // 20->21
        const realLimit = Math.min(50, limit);
        const realLimitPlusOne = realLimit + 1

        const replacements: any[] = [realLimitPlusOne, req.session.userId]

        if (cursor) {
            const parseCurrsor = new Date(parseInt(cursor))
            replacements.push(parseCurrsor)
        }


        const qb = getConnection().getRepository(List).createQueryBuilder("p")
            // .innerJoinAndSelect("p.creator", "u", 'u.id = p.creatorId')
            .orderBy("p.createdAt", "DESC").take(realLimitPlusOne)
        // if (req.session.userId) {
        //     qb.leftJoinAndSelect("p.updoots", "up", 'up.postId = p.id and userId =' + req.session.userId)
        // }

        if (cursor) {
            qb.where("p.createdAt < :cursor", {
                cursor: new Date(parseInt(cursor))
            })
        }
        const posts = await qb.getMany()

        return { rows: posts.slice(0, realLimit), hasMore: posts.length === realLimitPlusOne };
    }

    @Query(() => List, { nullable: true })
    post(
        @Arg('id', () => Int) id: number,
    ): Promise<List | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        return List.findOne(id);
    }

    @Mutation(() => List)
    @UseMiddleware(isAuth)
    async createPost(
        @Arg("input") input: PostInput,
        @Ctx() { req }: MyContext
    ): Promise<List> {

        return await List.create({ ...input, creatorId: req.session.userId }).save()
    }

    @Mutation(() => List, { nullable: true })
    @UseMiddleware(isAuth)
    async updatePost(
        @Arg("id", () => Int) id: number,
        @Arg("title") title: string,
        @Arg("text") text: string,
        @Ctx() { req }: MyContext
    ): Promise<List | null> {

        const result = await List.update({
            id,
            creatorId: req.session.userId
        }, { title, text })
        if (result.affected) {
            const post = await List.findOne(id)
            if (post) {
                return post
            }
        }

        return null;
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deletePost(
        @Arg("id", () => Int) id: number,
        @Ctx() { req }: MyContext
    ): Promise<boolean> {
        await List.delete({ id, creatorId: req.session.userId })
        return true;
    }
}