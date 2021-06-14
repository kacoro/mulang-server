import { Resolver, Arg, Int, Mutation, Ctx, Query, UseMiddleware, FieldResolver, Root, ObjectType, Field } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { Menu } from "../entities/Menu";
import { isAuth } from "../middleware/isAuth";
import { MenuGroup } from "../entities/MenuGroup";
import { listToTree } from "../utils/treetoArray";
import { Project } from "../entities/Project";
import { CateResolver } from "./category";
import { Category } from "../entities/Category";
import { ListResolver } from "./list";

@ObjectType()
class MenuTree {
    @Field(() => String)
    title:string

    @Field(()=>String)
    id:string

    @Field(()=>String)
  	link:string
      
    @Field(()=>Int)
    target:number

    @Field(()=>[MenuTree],{nullable:true})
    children?:MenuTree[]
    
}

@Resolver(Menu)
export class MenuResolver {

    @FieldResolver(() => Boolean, { nullable: true })
    isLeaf(
        @Root() root: Menu
    ): Boolean | null {
        return root?.children?.length > 0 ? false : true
    }

    @Mutation(() => Menu) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createMenu(
        @Arg('title', () => String) title: string,
        @Arg('groupId', () => Int) groupId: number,
        @Arg('parentId', () => Int, { nullable: true }) parentId: number,
        @Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('listId', () => Int, { nullable: true }) listId: number,
        @Arg('type', () => String) type: string,
        @Arg('link', () => String, { nullable: true }) link: string,
        @Arg('submenu', () => String, { nullable: true }) submenu: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('target', () => Int, { nullable: true }) target: number,
        @Ctx() { }: MyContext
    ): Promise<Menu | Boolean> { //: Promise<Post[]>
        const menuGroup = await MenuGroup.findOne({ id: groupId })
        if (!menuGroup) return false
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
        if (parentId) {
            const parent = await Menu.findOne({ id: parentId })
            if (parent) {
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
        if (id) {
            return await Menu.findOne(id, { relations: ["children"] });
        } else {
            return undefined
        }
    }

    @Query(() => [Menu])
    async menus(
        @Arg('groupId', () => Int) groupId: number,
        @Arg("parentId", () => Int, { nullable: true }) parentId: number,

    ): Promise<Menu[]> {
        let condition = { groupId }
        const qb = getConnection().getRepository(Menu).createQueryBuilder("menu").orderBy("menu.sort", "ASC").leftJoinAndSelect("menu.children", "children")
        if (parentId) {
            condition = Object.assign(condition, { parentId })
        } else {
            condition = Object.assign(condition, { parentId: 0 })
        }
        const data = await qb.where(condition).getMany()

        return data
    }

    @Query(() => [MenuTree])
    async menuTree(
        @Arg('identifier', () => String) identifier: string,
        //  @Ctx() {loaders}:MyContext
    ): Promise<MenuTree[]> {
        const menuGroup = await MenuGroup.findOne({ identifier })
        // const manager = getManager();
        if (!menuGroup) return []
        const { id: groupId } = menuGroup
        const menus = await Menu.find({ where: { groupId, status: 1 }, order: { sort: "ASC" } })
        //为了提高性能应该先把不同的类型分类。之后一次性查出
        let projectIds: number[] = []
        menus.forEach(item => {
            const { projectId } = item
            if (projectId) {
                projectIds.push(projectId)
            }
        })
        projectIds = Array.from(new Set(projectIds))

        const projects = await Project.findByIds(projectIds as number[])
        const IdToProject: Record<number, Project> = {};
        projects.forEach((p) => {
            IdToProject[p.id] = p;
        });
        // const sortedProject = projectIds.map((id) => IdToProject[id]);
        // console.log(sortedProject)
        let newMenus: any[] = []
        const task = async () => {
            // menus.forEach(async item =>  {
            for (const item of menus) {
                const { type, title, projectId, submenu, id, parentId, target, link ,listId} = item
                let _project = null
                if (projectId) {
                    _project = IdToProject[projectId]
                }

                let cates: Category[] = []
                switch (type) {
                    case 'project': //项目的时候检查submenu的类型根据类型再去读取
                        if (!_project) break
                        const { categoryId, identifier: projectIdentifier } = _project
                        newMenus.push({ parentId, id, title, target, link:`/${projectIdentifier}` })
                        if (typeof categoryId != undefined) {
                            cates = await new CateResolver().categorys(categoryId)
                        }
                        if (submenu == 'cate1') {
                            for (const cate of cates) {
                                newMenus.push({ parentId: id, id: `id-${cate.id}`, title: cate.name, target, link:`/${projectIdentifier}?cateogryId=${cate.id}` })
                            }
                        } else if (submenu == 'cate2') {
                            for (const cate of cates) {
                                newMenus.push({ parentId: id, id: `id-${cate.id}`, title: cate.name, target, link:`/${projectIdentifier}?cateogryId=${cate.id}` })

                                for (const child of cate.children) {
                                    newMenus.push({ parentId: `id-${cate.id}`, id: `id-${cate.id}-${child.id}`, title: child.name, target, link:`/${projectIdentifier}?cateogryId=${child.id}` })
                                }
                            }
                        } else if (submenu == 'title1') {//读取主题
                            let lists = await new ListResolver().lists(projectIdentifier, 0, 5)
                            if (lists?.lists)
                                for (const list of lists.lists) {
                                    newMenus.push({ parentId: id, id: `id-${list.id}`, title: list.title, target, link:`/${projectIdentifier}/${list.id}` })
                                }
                        } else if (submenu == 'title2') {//主题及子主题

                        } else if (submenu == 'cate_title') {

                            for (const cate of cates) {
                                newMenus.push({ parentId: id, id: `id-${cate.id}`, title: cate.name, target,  link:`/${projectIdentifier}?cateogryId=${cate.id}` })
                                let lists = await new ListResolver().lists(projectIdentifier, cate.id, 5)
                                if (lists?.lists)
                                    for (const list of lists.lists) {
                                        newMenus.push({ parentId: `id-${cate.id}`, id: `id-${cate.id}-${list.id}`, title: list.title, target, link:`/${projectIdentifier}/${list.id}` })
                                    }
                            }
                        }
                        break;
                    case 'list':
                        if (!_project) break
                        const {  identifier: _identifier } = _project
                        newMenus.push({ parentId, id, title, target, link:`/${_identifier}/${listId}` })

                        break;
                    default: //默认是自定义链接
                        newMenus.push({ parentId, id, title, target, link })
                        break;
                }
            }
        }

        await task()
        const menuTree = listToTree(newMenus)
        return menuTree
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteMenu(
        @Arg("id", () => Int) id: number,
        @Ctx() { }: MyContext
    ): Promise<boolean> {
        if (!id) return false;

        await getConnection().transaction(async transactionalManager => {
            await transactionalManager.createQueryBuilder()
                .delete()
                .from(Menu)
                .where('parentId = :id', { id: id })
                .execute();
            await transactionalManager.createQueryBuilder()
                .delete()
                .from(Menu)
                .where('id = :id', { id: id })
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
        @Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('listId', () => Int, { nullable: true }) listId: number,
        @Arg('type', () => String, { nullable: true }) type: string,
        @Arg('link', () => String, { nullable: true }) link: string,
        @Arg('submenu', () => String, { nullable: true }) submenu: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('target', () => Int, { nullable: true }) target: number,
        @Ctx() { }: MyContext
    ): Promise<Menu | null> {
        let condition = {} //管理员不需要过滤
        if (typeof title != "undefined") {
            condition = Object.assign(condition, { title })
        }
        if (typeof projectId != "undefined") {
            condition = Object.assign(condition, { projectId })
        }
        if (typeof categoryId != "undefined") {
            condition = Object.assign(condition, { categoryId })
        }
        if (typeof listId != "undefined") {
            condition = Object.assign(condition, { listId })
        }
        if (typeof type != "undefined") {
            condition = Object.assign(condition, { type })
        }
        if (typeof link != "undefined") {
            condition = Object.assign(condition, { link })
        }
        if (typeof submenu != "undefined") {
            condition = Object.assign(condition, { submenu })
        }
        if (typeof target != "undefined") {
            condition = Object.assign(condition, { target })
        }
        if (typeof sort != "undefined") {
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

