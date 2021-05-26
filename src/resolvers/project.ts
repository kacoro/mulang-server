import { Resolver, Arg, Int, Mutation, Ctx, Query, FieldResolver, Root } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { Project } from "../entities/Project";
import {Module} from "../entities/Module"
@Resolver(Project)
export class ProjectResolver {
    @FieldResolver(() => String)
    module(
        @Root() project: Project,
        // @Ctx() {loaders}:MyContext
    ) {
        return Module.findOne({id:project.moduleId})
      // return loaders.UserLoader.load(post.creatorId)
    } 
    
    @Mutation(() => Project, { nullable: true }) // ()=> [Post]
    async createProject(
        @Arg('title', () => String) title: string,
        @Arg('identifier', () => String) identifier: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('moduleId', () => Int) moduleId: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('listFields', () => String, { nullable: true }) listFields: string,
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
        @Arg('id', () => Int) id: number,
    ): Promise<Project | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        return Project.findOne(id);
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
    async deleteProject(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<boolean> {
        await Project.delete({ id})
        return true;
    }

    @Mutation(() => Project, { nullable: true })
    async updateProject(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String) title: string,
        @Arg('identifier', () => String) identifier: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('moduleId', () => Int, { nullable: true }) moduleId: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('note', () => String, { nullable: true }) note: string,
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
        // if(moduleId){
        //     const manager = getManager();
        //     const module =  await manager.findOne(Module, {id:moduleId});
        //     if(module){
        //         condition = Object.assign(condition, { module })
        //     }
        // }
        
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

