import { Resolver, Arg, Int, Mutation, Ctx, Query, FieldResolver, Root, UseMiddleware } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { Project } from "../entities/Project";
import {Module} from "../entities/Module"
import { Category } from "../entities/Category"
import { Field } from "../entities/Field"
import { Seo } from "../entities/Seo";
import GraphQLJSON from "graphql-type-json";
import { isAuth } from "../middleware/isAuth";
@Resolver(Project)
export class ProjectResolver {

    @FieldResolver(() => Module,{nullable:true})
    module(
        @Root() project: Project,
        // @Ctx() {loaders}:MyContext
    ) {
        return Module.findOne({id:project.moduleId})
      // return loaders.UserLoader.load(post.creatorId)
    } 

    @FieldResolver(() => Seo,{nullable:true})
    seo(
        @Root() project: Project,
    ):Seo|null{
        if(project.isSeo&&(project.seoTitle||project.seoKeywords||project.seoDesc)){
            return {title:project.seoTitle,keywords:project.seoKeywords,description:project.seoDesc}
        }else{
            return null
        }
    }

    @FieldResolver(() => [Field],{nullable:true})
    fields(
        @Root() project: Project,
         @Ctx() {loaders}:MyContext
    ): Promise<Field[]|null> {
       // return Field.find({where:{moduleId:project.moduleId},order:{sort:"ASC"}})
      return loaders.FieldLoader.load(project.moduleId)
    } 

    @FieldResolver(() => Category,{nullable:true})
    async category(
        @Root() project: Project,
        // @Ctx() {loaders}:MyContext
    ): Promise<Category | null> {
        let treeCategories = null;
        const manager = getManager();
        let parentCategory = await Category.findOne({id:project.categoryId})
        if(parentCategory){
            let cate = await manager.getTreeRepository(Category).findDescendantsTree(parentCategory);
            if (cate) {
                treeCategories = cate
            }
        }
        
            return treeCategories
      // return loaders.UserLoader.load(post.creatorId)
    } 
    
    @Mutation(() => Project, { nullable: true }) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createProject(
        @Arg('title', () => String) title: string,
        @Arg('identifier', () => String) identifier: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('moduleId', () => Int) moduleId: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('listFields', () => String, { nullable: true }) listFields: string,
        @Arg('isSeo', () => Int, { nullable: true }) isSeo: number,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
        // @Arg('table', () => String, { nullable: true }) table: string,
        @Ctx() { }: MyContext
    ): Promise<Project|null> { //: Promise<Post[]>
        const csub = new Project();
        const manager = getManager();
        csub.title = title;
        csub.identifier = identifier;
        csub.sort = sort;
        csub.status = status;
        csub.note = note;
        csub.moduleId = moduleId;
        csub.categoryId = categoryId;
        csub.listFields = listFields
        
        const module =  await manager.findOne(Module, {id:moduleId});
        if(typeof isSeo !="undefined"){
            csub.isSeo = isSeo
            if(typeof seo !="undefined"&&isSeo!=0){
                csub.seoTitle = seo.title||""
                csub.seoKeywords = seo.keywords||""
                csub.seoDesc = seo.description||""
            }
        }
        // if(module){
        //     const project =  await manager.save(csub);
        //     module.projects = [project]
        //     await manager.save(module)
        //     return project
        // }
        if(module){
            csub.module = module
            
            return await manager.save(csub);
        }
        return null
        
    }

    @Query(() => Project, { nullable: true })
    async project(
        @Arg('id', () => Int, { nullable: true }) id: number,
        @Arg('identifier', () => String, { nullable: true }) identifier: string,
    ): Promise<Project | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        if(id){
            return await Project.findOne(id);
        } else if(identifier){
            return Project.findOne({where:{identifier:identifier}});
        }else{
            return undefined
        }
        
    }
    
    @Query(() => [Project])
    async projects(
        // @Arg('id', () => Int, { nullable: true }) id: number
    ): Promise<Project[]> {
        const qb = getConnection().getRepository(Project).createQueryBuilder("p")
        const data = await qb.getMany()
        return data
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteProject(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<boolean> {
        await Project.delete({ id})
        return true;
    }

    @Mutation(() => Project, { nullable: true })
    @UseMiddleware(isAuth)
    async updateProject(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String) title: string,
        @Arg('identifier', () => String) identifier: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('moduleId', () => Int, { nullable: true }) moduleId: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('isSeo', () => Int, { nullable: true }) isSeo: number,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
        @Arg('listFields', () => String, { nullable: true }) listFields: string,
        @Ctx() {  }: MyContext
    ): Promise<Project | null> {
        let condition = { } //管理员不需要过滤
        if(typeof title !="undefined"){
            condition = Object.assign(condition, { title })
        }
        if(typeof identifier !="undefined"){
            condition = Object.assign(condition, { identifier })
        }
        if(typeof note !="undefined"){
            condition = Object.assign(condition, { note })
        }
        if(typeof sort !="undefined"){
            condition = Object.assign(condition, { sort })
        }
        if(typeof categoryId !="undefined"){
            condition = Object.assign(condition, { categoryId })
        }
        if(typeof moduleId !="undefined"){
            condition = Object.assign(condition, { moduleId })
        }
        if(typeof status !="undefined"){
            condition = Object.assign(condition, { status })
        }
        if(typeof listFields !="undefined"){
            condition = Object.assign(condition, { listFields })
        }
        if(typeof isSeo !="undefined"){
            condition = Object.assign(condition, { isSeo })
            if(typeof seo !="undefined"&&isSeo!=0){
                condition = Object.assign(condition, { seoTitle:seo.title||"" })
                condition = Object.assign(condition, { seoKeywords:seo.keywords||"" })
                condition = Object.assign(condition, { seoDesc:seo.description||"" })
            }
        }
        
        const result = await Project.update({
            id
        }, condition)
        if (result.affected) {
            const project = await Project.findOne(id)
            if (project) {
                return project
            }
        }
       
        return null;
    }
   
}

