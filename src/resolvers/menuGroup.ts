import { Resolver, Arg, Int, Mutation, Ctx, Query,  UseMiddleware } from "type-graphql";
import { MyContext } from "../types";
import { AppDataSource,Manager } from "../index";
import { MenuGroup } from "../entities/MenuGroup";
import { isAuth } from "../middleware/isAuth";
@Resolver(MenuGroup)
export class MenuGroupResolver {

    @Mutation(() => MenuGroup) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createMenuGroup(
        @Arg('title', () => String) title: string,
        @Arg('identifier', () => String) identifier: string,
        @Ctx() { }: MyContext
    ): Promise<MenuGroup> { //: Promise<Post[]>
        const csub = new MenuGroup();
        csub.title = title;
        csub.identifier = identifier;
        return await Manager.save(csub);
    }

    @Query(() => MenuGroup, { nullable: true })
    async menuGroup(
        @Arg('id', () => Int, { nullable: true }) id: number,
     
    ): Promise<MenuGroup | null> {
        // return Post.findOne(id, { relations: ["creator"] });
        if(id){
            return await MenuGroup.findOneBy({id});
        } else{
            return null
        }
    }
    
    @Query(() => [MenuGroup])
    async menuGroups(
    ): Promise<MenuGroup[]> {
        const qb = AppDataSource.getRepository(MenuGroup).createQueryBuilder("p")
        const data = await qb.getMany()
        return data
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteMenuGroup(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<boolean> {
        if(!id) return false;
        await MenuGroup.delete({ id})
        return true;
    }

    @Mutation(() => MenuGroup, { nullable: true })
    @UseMiddleware(isAuth)
    async updateMenuGroup(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Ctx() {  }: MyContext
    ): Promise<MenuGroup | null> {
        let condition = { } //管理员不需要过滤
        if(typeof title !="undefined"){
            condition = Object.assign(condition, { title })
        }
        const result = await MenuGroup.update({
            id
        }, condition)
        if (result.affected) {
            const menuGroup = await MenuGroup.findOneBy({id})
            if (menuGroup) {
                return menuGroup
            }
        }
       
        return null;
    }
   
}

