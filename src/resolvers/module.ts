import { Resolver, Arg, Int, Mutation, Ctx, Query } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { Module } from "../entities/Module";
@Resolver(Module)
export class ModuleResolver {
    @Mutation(() => Module) // ()=> [Post]
    async createModule(
        @Arg('title', () => String) title: string,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('layout', () => String, { nullable: true }) layout: string,
        @Arg('type', () => Int, { nullable: true }) type: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('table', () => String, { nullable: true }) table: string,
        
        
        // @Arg('table', () => String, { nullable: true }) table: string,
        @Ctx() { }: MyContext
    ): Promise<Module> { //: Promise<Post[]>
        const csub = new Module();
        const manager = getManager();
        
        csub.title = title;
        csub.note = note;
        csub.sort = sort;
        csub.status = status;
        csub.table = table;
        csub.layout = layout;
        csub.type = type;
        
         const data =  await manager.save(csub);
         console.log(data)
        //创建时，创建新表
        await manager.query(`CREATE TABLE IF NOT EXISTS ${data.table}_${data.id}(
            id INT UNSIGNED AUTO_INCREMENT,
            projectId INT UNSIGNED,
            categoryId INT UNSIGNED,
            PRIMARY KEY ( id )
        )`);
        

         return data
    }

    @Query(() => Module, { nullable: true })
    module(
        @Arg('id', () => Int) id: number,
    ): Promise<Module | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        return Module.findOne(id);
    }
    
    @Query(() => [Module])
    async modules(
        // @Arg('id', () => Int, { nullable: true }) id: number
    ): Promise<Module[]> {
        const qb = getConnection().getRepository(Module).createQueryBuilder("p")
        const data = await qb.getMany()
        return data
    }

    @Mutation(() => Boolean)
    async deleteModule(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<Boolean> {
        const manager = getManager();
        const data = await Module.findOne(id);
        if(data){
            await Module.delete({ id})
             //创建时，创建新表
             await manager.query(`DROP TABLE IF EXISTS ${data.table}_${data.id}`);
        }
        
        return true;
    }

    @Mutation(() => Module, { nullable: true })
    async updateModule(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('layout', () => String, { nullable: true }) layout: string,
        @Arg('type', () => Int, { nullable: true }) type: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('table', () => String, { nullable: true }) table: string,
        @Ctx() {  }: MyContext
    ): Promise<Module | null> {
        let condition = { } //管理员不需要过滤
        if(typeof title !="undefined"){
            condition = Object.assign(condition, { title })
        }
        if(typeof note !="undefined"){
            condition = Object.assign(condition, { note })
        }
        if(typeof sort !="undefined"){
            condition = Object.assign(condition, { sort })
        }
        if(typeof layout !="undefined"){
            condition = Object.assign(condition, { layout })
        }
        if(typeof type !="undefined"){
            condition = Object.assign(condition, { type })
        }
        if(typeof status !="undefined"){
            condition = Object.assign(condition, { status })
        }
        if(typeof table !="undefined"){
            condition = Object.assign(condition, { table })
        }

        const result = await Module.update({
            id
        }, condition)
        if (result.affected) {
            const module = await Module.findOne(id)
            if (module) {
                return module
            }
        }
        return null;
    }
   
}

