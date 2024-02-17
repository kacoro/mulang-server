import { Post } from "../entities/Post";
import { Resolver, Query, Arg, Int, Mutation, InputType, Field, Ctx, UseMiddleware, FieldResolver, Root, ObjectType } from "type-graphql";
import { MyContext } from "../types";
import { isAuth } from "../middleware/isAuth";
import { Updoot } from "../entities/Updoot";
import {AppDataSource} from "../index"
@InputType()
class PostInput {
    @Field()
    title: string
    @Field()
    text: string
}

@ObjectType()
class PaginatedPosts {
    @Field(() => [Post])
    posts: Post[]
    @Field()
    hasMore: boolean;
}



@Resolver(Post)
export class PostResolver {
    @FieldResolver(() => String)
    textSnippet(
        @Root() root: Post
    ) {
        return root.text.slice(0, 50)
    }

    @FieldResolver(() => String)
    creator(
        @Root() post: Post,
        @Ctx() {loaders}:MyContext
    ) {
        // return User.findOne(post.creatorId)
       return loaders.UserLoader.load(post.creatorId)
    }    

    @FieldResolver(() => Int, { nullable: true })
    async voteStatus(
        @Root() root: Post,
        @Ctx() {loaders,payload}:MyContext
    ) {
        // console.log(root.updoots)
        // // root.updoots
        // if (root.updoots) {
        //     return root.updoots[0]?.value
        // } else {
        //     return null
        // }
        if(!payload){
            return null
        }
        const updoot = await loaders.UpdootLoader.load({postId:root.id,userId:payload.sub})
        return updoot ?updoot.value:null
    }

    @Mutation(() => Int)
    @UseMiddleware(isAuth)
    async vote(
        @Arg('postId', () => Int) postId: number,
        @Arg('value', () => Int) value: number,
        @Ctx() { payload }: MyContext
    ) {

        const isUpdoot = value !== -1;
        const realValue = isUpdoot ? 1 : -1
        const { userId } = payload

        const updoot = await Updoot.findOneBy({  postId, userId })
        // console.log("updoot:", updoot)
        // the user has voted on the post before
        // and they are changing their vote
        if (updoot && updoot.value !== realValue) {
            await Post.update({ id: postId }, { points: () => `points +${2 * realValue}` })
            await Updoot.update({
                userId,
                postId
            }, { value: realValue })
        } else if (!updoot) {

            await Post.update({ id: postId }, { points: () => `points +${realValue}` })
            await Updoot.insert({
                userId,
                postId,
                value: realValue
            })
        } else {
            return 0
        }

        return realValue
    }


    @Query(() => PaginatedPosts) // ()=> [Post]
    async posts(
        @Arg('limit', () => Int) limit: number,
        @Arg('cursor', () => String, { nullable: true }) cursor: string | null,
        @Ctx() { payload}: MyContext
    ): Promise<PaginatedPosts> { //: Promise<Post[]>
        // 20->21
        const realLimit = Math.min(50, limit);
        const realLimitPlusOne = realLimit + 1

        const replacements: any[] = [realLimitPlusOne, payload.sub]

        if (cursor) {
            const parseCurrsor = new Date(parseInt(cursor))
            replacements.push(parseCurrsor)
        }


        const qb = AppDataSource.getRepository(Post).createQueryBuilder("p")
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

        return { posts: posts.slice(0, realLimit), hasMore: posts.length === realLimitPlusOne };
    }

    @Query(() => Post, { nullable: true })
    post(
        @Arg('id', () => Int) id: number,
    ): Promise<Post | null> {
        // return Post.findOne(id, { relations: ["creator"] });
        return Post.findOneBy({id});
    }

    @Mutation(() => Post)
    @UseMiddleware(isAuth)
    async createPost(
        @Arg("input") input: PostInput,
        @Ctx() { payload }: MyContext
    ): Promise<Post> {

        return await Post.create({ ...input, creatorId: payload.sub }).save()
    }

    @Mutation(() => Post, { nullable: true })
    @UseMiddleware(isAuth)
    async updatePost(
        @Arg("id", () => Int) id: number,
        @Arg("title") title: string,
        @Arg("text") text: string,
        @Ctx() { payload }: MyContext
    ): Promise<Post | null> {

        const result = await Post.update({
            id,
            creatorId: payload.sub
        }, { title, text })
        if (result.affected) {
            const post = await Post.findOneBy({id})
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
        @Ctx() { payload }: MyContext
    ): Promise<boolean> {
        //not casecade way
        // const post = await Post.findOne(id)
        // if(!post){
        //     return false
        // }
        // if(post.creatorId !== req.session.userId){
        //     throw new Error("not authorized")
        // }
        // await Updoot.delete({postId:id})
        // await Post.delete({id,creatorId:req.session.userId})
        // return true;

        await Post.delete({ id, creatorId: payload.sub  })
        return true;
    }
}