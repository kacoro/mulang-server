import { Resolver, Arg, Int, Mutation, Ctx, Query,  UseMiddleware } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { OptionGroup } from "../entities/OptionGroup";
import { isAuth } from "../middleware/isAuth";
@Resolver(OptionGroup)
export class OptionGroupResolver {

    @Mutation(() => OptionGroup) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createOptionGroup(
        @Arg('title', () => String) title: string,
        @Arg('linkSymbol', () => String,{nullable:true}) linkSymbol: string,
       
        @Ctx() { }: MyContext
    ): Promise<OptionGroup> { //: Promise<Post[]>
        const csub = new OptionGroup();
        const manager = getManager();
        csub.title = title;
        csub.linkSymbol = linkSymbol;
        return await manager.save(csub);
    }

    @Query(() => OptionGroup, { nullable: true })
    async optionGroup(
        @Arg('id', () => Int, { nullable: true }) id: number,
     
    ): Promise<OptionGroup | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        if(id){
            return await OptionGroup.findOne(id);
        } else{
            return undefined
        }
    }
    
    @Query(() => [OptionGroup])
    async optionGroups(
    ): Promise<OptionGroup[]> {
        const qb = getConnection().getRepository(OptionGroup).createQueryBuilder("p")
        const data = await qb.getMany()
        return data
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteOptionGroup(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<boolean> {
        if(!id) return false;
        await OptionGroup.delete({ id})
        return true;
    }

    @Mutation(() => OptionGroup, { nullable: true })
    @UseMiddleware(isAuth)
    async updateOptionGroup(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Arg('linkSymbol', () => String, { nullable: true }) linkSymbol: string,
        @Ctx() {  }: MyContext
    ): Promise<OptionGroup | null> {
        let condition = { } //管理员不需要过滤
        if(typeof title !="undefined"){
            condition = Object.assign(condition, { title })
        }
        if(typeof linkSymbol !="undefined"){
            condition = Object.assign(condition, { linkSymbol })
        }
       
        const result = await OptionGroup.update({
            id
        }, condition)
        if (result.affected) {
            const optionGroup = await OptionGroup.findOne(id)
            if (optionGroup) {
                return optionGroup
            }
        }
       
        return null;
    }
   
}

