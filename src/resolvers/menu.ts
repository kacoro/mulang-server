import { Resolver, Arg, Int, Mutation, Ctx, Query,  UseMiddleware, FieldResolver, Root } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { Menu } from "../entities/Menu";
import { isAuth } from "../middleware/isAuth";
import { MenuGroup } from "../entities/MenuGroup";
@Resolver(Menu)
export class MenuResolver {

    @FieldResolver(() => Boolean,{nullable:true})
    isLeaf(
        @Root() root: Menu
    ):Boolean|null {
        return root?.children?.length>0?false:true
    }

    @Mutation(() => Menu) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createMenu(
        @Arg('title', () => String) title: string,
        @Arg('groupId', () => Int) groupId: number,
        @Arg('parentId', () => Int,{nullable:true}) parentId: number,
        @Arg('projectId', () => Int,{nullable:true}) projectId: number,
        @Arg('categoryId', () => Int,{nullable:true}) categoryId: number,
        @Arg('listId', () => Int,{nullable:true}) listId: number,
        @Arg('type', () => String) type: string,
        @Arg('link', () => String,{nullable:true}) link: string,
        @Arg('submenu', () => String,{nullable:true}) submenu: string,
        @Arg('sort', () => Int,{nullable:true}) sort: number,
        @Arg('target', () => Int,{nullable:true}) target: number,
        @Ctx() { }: MyContext
    ): Promise<Menu|Boolean> { //: Promise<Post[]>
        const menuGroup = await MenuGroup.findOne({id:groupId})
        if(!menuGroup) return false
        const csub = new Menu();
        const manager = getManager();
        csub.title = title;
        csub.sort = sort;
        csub.type = type;
        csub.submenu = submenu;
        csub.groupId = groupId;
        csub.projectId = projectId;
        csub.categoryId = categoryId;
        csub.target = target;
        csub.listId = listId;
        csub.link = link;
        if(parentId){
            const parent = await Menu.findOne({id:parentId})
            if(parent){
                csub.parentId = parentId;
                csub.parent = parent;
            }
        }
        
        csub.group = menuGroup
        console.log(csub)
        return await manager.save(csub);
    }

    @Query(() => Menu, { nullable: true })
    async menu(
        @Arg('id', () => Int, { nullable: true }) id: number,
     
    ): Promise<Menu | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        if(id){
            return await Menu.findOne(id,{ relations: ["children"]});
        } else{
            return undefined
        }
    }
    
    @Query(() => [Menu])
    async menus(
        @Arg('groupId', () => Int) groupId: number,
        @Arg("parentId" ,() => Int,{nullable:true}) parentId: number,
        
    ): Promise<Menu[]> {
        let condition = {groupId}
        const qb = getConnection().getRepository(Menu).createQueryBuilder("menu").orderBy("menu.sort", "ASC").leftJoinAndSelect("menu.children", "children")
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
    async deleteMenu(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<boolean> {
        if(!id) return false;
        
        await getConnection().transaction(async transactionalManager => {
            await transactionalManager.createQueryBuilder()
                .delete()
                .from(Menu)
                .where('parentId = :id', {id: id})
                .execute();
            await transactionalManager.createQueryBuilder()
                .delete()
                .from(Menu)
                .where('id = :id', {id: id})
                .execute();
        })
        //await Menu.delete({ id})
        return true;
    }

    @Mutation(() => Menu, { nullable: true })
    @UseMiddleware(isAuth)
    async updateMenu(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Arg('projectId', () => Int,{nullable:true}) projectId: number,
        @Arg('categoryId', () => Int,{nullable:true}) categoryId: number,
        @Arg('listId', () => Int,{nullable:true}) listId: number,
        @Arg('type', () => String,{nullable:true}) type: string,
        @Arg('link', () => String,{nullable:true}) link: string,
        @Arg('submenu', () => String,{nullable:true}) submenu: string,
        @Arg('sort', () => Int,{nullable:true}) sort: number,
        @Arg('target', () => Int,{nullable:true}) target: number,
        @Ctx() {  }: MyContext
    ): Promise<Menu | null> {
        let condition = { } //管理员不需要过滤
        if(typeof title !="undefined"){
            condition = Object.assign(condition, { title })
        }
        if(typeof projectId !="undefined"){
            condition = Object.assign(condition, { projectId })
        }
        if(typeof categoryId !="undefined"){
            condition = Object.assign(condition, { categoryId })
        }
        if(typeof listId !="undefined"){
            condition = Object.assign(condition, { listId })
        }
        if(typeof type !="undefined"){
            condition = Object.assign(condition, { type })
        }
        if(typeof link !="undefined"){
            condition = Object.assign(condition, { link })
        }
        if(typeof submenu !="undefined"){
            condition = Object.assign(condition, { submenu })
        }
        if(typeof target !="undefined"){
            condition = Object.assign(condition, { target })
        }
        if(typeof sort !="undefined"){
            condition = Object.assign(condition, { sort })
        }
       
        const result = await Menu.update({
            id
        }, condition)
        if (result.affected) {
            const menu = await Menu.findOne(id)
            if (menu) {
                return menu
            }
        }
       
        return null;
    }
   
}

