import { Resolver, Arg, Int, Mutation, Ctx, Query, UseMiddleware } from "type-graphql";
import { MyContext } from "../types";
import { AppDataSource,Manager } from "../index";
import { Module } from "../entities/Module";
import { isAuth } from "../middleware/isAuth";
@Resolver(Module)
export class ModuleResolver {
    @Mutation(() => Module) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createModule(
        @Arg('title', () => String) title: string,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('layout', () => String, { nullable: true }) layout: string,
        @Arg('type', () => Int, { nullable: true }) type: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('table', () => String, { nullable: true }) table: string,
        @Arg('isSeo', () => Boolean, { nullable: true }) isSeo: boolean,
      
        // @Arg('table', () => String, { nullable: true }) table: string,
        @Ctx() { }: MyContext
    ): Promise<Module> { //: Promise<Post[]>
        const csub = new Module();
        csub.title = title;
        csub.note = note;
        csub.sort = sort;
        csub.status = status;
        csub.table = table;
        csub.layout = layout;
        csub.type = type;
        csub.isSeo = isSeo;
        const data =  await Manager.save(csub);
        // console.log(data)
        //创建时，创建新表
       
        await Manager.query(`CREATE TABLE IF NOT EXISTS ${data.table}_${data.id}(
            id INT UNSIGNED AUTO_INCREMENT,
            moduleId INT UNSIGNED,
            projectId INT UNSIGNED,
            categoryId INT UNSIGNED,
            title varchar(255),
            createdAt timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
            updatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
            PRIMARY KEY ( id )
        )`);

        if(isSeo){ //为真添加
            let sql = `ALTER TABLE list_${data.id} `
            sql += `Add seoTitle varchar(255),Add seoKeywords varchar(255),Add seoDesc varchar(255) `
            await Manager.query(sql);
        }   
         return data
    }

    @Query(() => Module, { nullable: true })
    module(
        @Arg('id', () => Int) id: number,
    ): Promise<Module | null> {
        // return Post.findOne(id, { relations: ["creator"] });
        return Module.findOneBy({id});
    }
    
    @Query(() => [Module])
    async modules(
        // @Arg('id', () => Int, { nullable: true }) id: number
    ): Promise<Module[]> {
        const qb = AppDataSource.getRepository(Module).createQueryBuilder("p")
        const data = await qb.getMany()
        return data
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteModule(
        @Arg("id", () => Int) id: number,
        @Ctx() {  }: MyContext
    ): Promise<Boolean> {
        const data = await Module.findOneBy({id});
        //删除前要确保没有被project使用
        if(data){
            await Module.delete({ id})
             //创建时，创建新表
             await Manager.query(`DROP TABLE IF EXISTS ${data.table}_${data.id}`);
             //删除模块
             await await Manager.query(`DELETE  FROM  field WHERE moduleId = ${id}`)
        }
        
        return true;
    }

    @Mutation(() => Module, { nullable: true })
    @UseMiddleware(isAuth)
    async updateModule(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('layout', () => String, { nullable: true }) layout: string,
        @Arg('type', () => Int, { nullable: true }) type: number,
        @Arg('status', () => Int, { nullable: true }) status: number,
        @Arg('table', () => String, { nullable: true }) table: string,
        @Arg('isSeo', () => Boolean, { nullable: true }) isSeo: boolean,
        @Arg('isHits', () => Boolean, { nullable: true }) isHits: boolean,
        @Arg('isPublishTime', () => Boolean, { nullable: true }) isPublishTime: boolean,
        @Arg('isSort', () => Boolean, { nullable: true }) isSort: boolean,
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
        const oldModule = await Module.findOneBy({id})
        if(!oldModule) return null
        if(typeof isSeo !="undefined"&&oldModule.isSeo!=isSeo){
            
            condition = Object.assign(condition, { isSeo })
            //更新seo 需要改变 数据列 即添加或删除
            
            let sql = `ALTER TABLE list_${id} `
            if(isSeo){ //为真添加
                sql += `Add seoTitle varchar(255),Add seoKeywords varchar(255),Add seoDesc varchar(255) `
            }else{ //为假删除
                 sql += `Drop seoTitle seoKeywords seoDesc`
            }
            await Manager.query(sql);
        }
        if(typeof isHits !="undefined"&&oldModule.isHits!=isHits){
            condition = Object.assign(condition, { isHits })
            let sql = `ALTER TABLE list_${id} `
            if(isHits){
                sql += `Add hits int(10) DEFAULT 0`
            }else{
                sql += `Drop hits`
            }
            await Manager.query(sql);

        }
        if(typeof isPublishTime !="undefined"&&oldModule.isPublishTime!=isPublishTime){
            condition = Object.assign(condition, { isPublishTime })
            let sql = `ALTER TABLE list_${id} `
            if(isPublishTime){
                sql += `Add publishTime timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间'`
            }else{
                sql += `Drop publishTime`
            }
            await Manager.query(sql);
        }
        if(typeof isSort !="undefined"&&oldModule.isSort!=isSort){
            condition = Object.assign(condition, { isSort })
            let sql = `ALTER TABLE list_${id} `
            if(isSort){
                sql += `Add sort Int(11) DEFAULT 0 COMMENT '排序'`
            }else{
                sql += `Drop sort`
            }
            await Manager.query(sql);
        }

        const result = await Module.update({
            id
        }, condition)
        if (result.affected) {
            const module = await Module.findOneBy({id})
            if (module) {
                return module
            }
        }
        return null;
    }
   
}

