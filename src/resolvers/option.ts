import { Resolver, Arg, Int, Mutation, Ctx, Query,  UseMiddleware, FieldResolver, Root } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { Option } from "../entities/Option";
import { isAuth } from "../middleware/isAuth";
import { OptionGroup } from "../entities/OptionGroup";
@Resolver(Option)
export class OptionResolver {

    @FieldResolver(() => Boolean,{nullable:true})
    isLeaf(
        @Root() root: Option
    ):Boolean|null {
        return root?.children?.length>0?false:true
    }

    @Mutation(() => Option) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createOption(
        @Arg('title', () => String) title: string,
        @Arg('value', () => String) value: string,
        @Arg('groupId', () => Int) groupId: number,
        @Arg('parentId', () => Int,{nullable:true}) parentId: number,
        @Arg('sort', () => Int,{nullable:true}) sort: number,
        @Ctx() { }: MyContext
    ): Promise<Option|Boolean> { //: Promise<Post[]>
        const optionGroup = await OptionGroup.findOne({id:groupId})
        if(!optionGroup) return false
        const csub = new Option();
        const manager = getManager();
        
        csub.title = title;
        csub.value = value;
        csub.sort = sort;
        csub.groupId = groupId;
        if(parentId){
            const parent = await Option.findOne({id:parentId})
            if(parent){
                csub.parentId = parentId;
                csub.parent = parent;
            }
        }
        
        csub.group = optionGroup
        console.log(csub)
        return await manager.save(csub);
    }

    @Query(() => Option, { nullable: true })
    async option(
        @Arg('id', () => Int, { nullable: true }) id: number,
     
    ): Promise<Option | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        if(id){
            return await Option.findOne(id,{ relations: ["children"]});
        } else{
            return undefined
        }
    }
    
    @Query(() => [Option])
    async options(
        @Arg('groupId', () => Int) groupId: number,
        @Arg("parentId" ,() => Int,{nullable:true}) parentId: number,
    ): Promise<Option[]> {
        let condition = {groupId}
        const qb = getConnection().getRepository(Option).createQueryBuilder("option").orderBy("option.sort", "ASC").leftJoinAndSelect("option.children", "children")
        if(parentId){
            condition = Object.assign(condition, { parentId })
        }else{
            condition = Object.assign(condition, { parentId:0})
        }
        const data = await qb.where(condition).getMany()

        return data
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteOption(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<boolean> {
        if(!id) return false;
        
        await getConnection().transaction(async transactionalManager => {
            await transactionalManager.createQueryBuilder()
                .delete()
                .from(Option)
                .where('parentId = :id', {id: id})
                .execute();
            await transactionalManager.createQueryBuilder()
                .delete()
                .from(Option)
                .where('id = :id', {id: id})
                .execute();
        })
        //await Option.delete({ id})
        return true;
    }

    @Mutation(() => Option, { nullable: true })
    @UseMiddleware(isAuth)
    async updateOption(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Arg('value', () => String) value: string,
        @Arg('sort', () => Int,{nullable:true}) sort: number,
        @Ctx() {  }: MyContext
    ): Promise<Option | null> {
        let condition = { } //管理员不需要过滤
        if(typeof title !="undefined"){
            condition = Object.assign(condition, { title })
        }
        if(typeof value !="undefined"){
            condition = Object.assign(condition, { value })
        }
        if(typeof sort !="undefined"){
            condition = Object.assign(condition, { sort })
        }
       
        const result = await Option.update({
            id
        }, condition)
        if (result.affected) {
            const option = await Option.findOne(id)
            if (option) {
                return option
            }
        }
       
        return null;
    }
   
}

