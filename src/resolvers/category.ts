import { Resolver, Arg, Int, Mutation, Ctx, Query, Root, FieldResolver, UseMiddleware } from "type-graphql";
import { MyContext } from "../types";
import { getManager } from "typeorm";
import { Category } from "../entities/Category";
import GraphQLJSON from "graphql-type-json";
import { Seo } from "../entities/Seo";
import { isAuth } from "../middleware/isAuth";

@Resolver(Category)
export class CateResolver {
    @FieldResolver(() => Seo,{nullable:true})
    seo(
        @Root() category: Category,
    ):Seo|null{
        if(category.seoTitle||category.seoKeywords||category.seoDesc){
            return {title:category.seoTitle,keywords:category.seoKeywords,description:category.seoDesc}
        }else{
            return null
        }
    }
    
    @Mutation(() => Category) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createCategory(
        @Arg('name', () => String) name: string,
        @Arg('identity', () => String) identity: string,
        @Arg('parantId', () => Int, { nullable: true }) parentId: number,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
        @Ctx() { }: MyContext
    ): Promise<Category> { //: Promise<Post[]>
        const csub = new Category();
        const manager = getManager();
        if(identity){
            csub.identity = identity
        }
        if(typeof seo !="undefined"){
            csub.seoTitle = seo.title||""
            csub.seoKeywords = seo.keywords||""
            csub.seoDesc = seo.description||""
        }
        csub.name = name;
        if (parentId) {
            const croot = await manager.getTreeRepository(Category).findOne({ id: parentId });
            if (croot) {
                csub.parent = croot;
            }
        }
        return await manager.save(csub);
    }

    @Mutation(()=>Category, { nullable: true })
    @UseMiddleware(isAuth)
    async updateCategory(
        @Arg('id', () => Int, { nullable: true }) id: number,
        @Arg("name") name: string,
        @Arg('identity',()=> String,{nullable:true}) identity:string |null,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
    ){
        let condition = { name} //管理员不需要过滤
        if(identity){
            condition = Object.assign(condition, { identity })
        }
        if(typeof seo !="undefined"){
            condition = Object.assign(condition, { seoTitle:seo.title||"" })
            condition = Object.assign(condition, { seoKeywords:seo.keywords||"" })
            condition = Object.assign(condition, { seoDesc:seo.description||"" })
        }
        const result = await Category.update({
            id,
        }, condition)
        if (result.affected) {
            const cate = await Category.findOne(id)
            if (cate) {
                return cate
            }
        }
        return null;
    }
    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteCategory(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<boolean> {
        await Category.delete({ id})
        return true;
    }



    @Query(() => [Category])
    async categorys(
        @Arg('id', () => Int, { nullable: true }) id: number
    ): Promise<Category[]> {
        const manager = getManager();
        let treeCategories = [] as Category[]
        if (!id) {
            treeCategories = await manager.getTreeRepository(Category).findTrees();
        }
        else {
            // where mpath LIKE '2.%'；
            let parentCategory = await Category.findOne(id)
            if (parentCategory) {
                let cate = await manager.getTreeRepository(Category).findDescendantsTree(parentCategory);
                if (cate) {
                    treeCategories = cate.children
                }
            }
        }

        return treeCategories
    }

    @Query(() => Category,{nullable:true})
    async category(
        @Arg('id', () => Int,{nullable:true}) id: number | null,
        @Arg('identity',()=> String,{nullable:true}) identity:string |null
    ): Promise<Category | null> {
        
        const manager = getManager();
        let treeCategories = null
        let parentCategory = undefined
        if(identity){
            parentCategory = await Category.findOne({identity})
        }else if(id){
            parentCategory = await Category.findOne(id)

        }
        if (parentCategory) {
            let cate = await manager.getTreeRepository(Category).findDescendantsTree(parentCategory);
            if (cate) {
                treeCategories = cate
            }
        }
        return treeCategories
    }

}