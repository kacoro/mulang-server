import { List } from "../entities/List";
import { Resolver, Query, Arg, Int, Mutation, ObjectType, Field, UseMiddleware, } from "type-graphql";

import { getManager } from "typeorm";
// import GraphQLJSON, { GraphQLJSONObject } from 'graphql-type-json'
import GraphQLJSON from 'graphql-type-json'
import { Project } from "../entities/Project";
import { Seo } from "../entities/Seo";
import { isAuth } from "../middleware/isAuth";

// import { createUnionType } from "type-graphql";

interface dictType {
    [key: string]:string,
}

function toLiteral(str: string) {
    var dict = { '\b': 'b', '\t': 't', '\n': 'n', '\v': 'v', '\f': 'f', '\r': 'r' } as dictType;
    return str.replace(/([\\'"\b\t\n\v\f\r])/g, function(_$0: any, $1: string ) {
        return '\\' + (dict[$1] || $1);
    });

}


@ObjectType()
class Content {
    @Field(() => GraphQLJSON)
    content: JSON

    @Field(()=>Seo,{nullable:true})
    seo:Seo|null
   
}

@ObjectType()
class Paginated {
    // @Field(() => [GraphQLJSON])
    // lists: JSON[]

    @Field(() => [List])
    lists: List[]

    @Field(() => Int)
    page: number

    @Field(() => Int)
    limit: number

    @Field()
    hasMore: boolean;

    @Field()
    total: number

    @Field()
    totalPage: number
}

@Resolver(List)
export class ListResolver {
    
    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async createList(
        //@Arg('moduleId', () => Int, { nullable: true }) moduleId: number,
        //@Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('projectIdentifier', () => String) projectIdentifier: string,
        @Arg('json', () => GraphQLJSON) json: JSON,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
    ) {

        const project = await Project.findOne({ identifier: projectIdentifier });
        if (!project) {
            return false
        }
        const {moduleId,id:projectId,isSeo} = project
        //更严谨的应该从模块中读取字段列
        let columns = `projectId`
        let values = `${projectId}`
        for (let [key, value] of Object.entries(json)) {
            columns += `,${key}`
            if (typeof value == "string") {
                value = toLiteral(value)
                values += `,"${value}"`
            } else {
                values += `,${value}`
            }
            //console.log([key, value]); // ['a', 1], ['b', 2], ['c', 3]
        }
        if(isSeo>0&&typeof seo !="undefined"){
            columns += `,seoTitle,seoKeywords,seoDesc`
            values += `,"${seo.title||""}","${seo.keywords||""}","${seo.description||""}"`
        }
        console.log(columns, values)
        let sql = `
          INSERT INTO  list_${moduleId} (${columns})
          VALUES
          (${values})
          `
        const manager = getManager();
        await manager.query(sql)
        return true
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async updateList(
        @Arg('id', () => Int) id: number,
        @Arg('projectIdentifier', () => String, { nullable: true }) projectIdentifier: string,
        // @Arg('moduleId', () => Int, { nullable: true }) moduleId: number,
        // @Arg('projectId', () => Int) projectId: number,
        @Arg('json', () => GraphQLJSON) json: JSON,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
    ) {
        const project = await Project.findOne({ identifier: projectIdentifier });
        if(!project){
            return false
        }
        const {moduleId,isSeo} = project
      
        if (!moduleId) {
            return false
        }
        //更严谨的应该从模块中读取字段列
        let setSql = []
        for (let [key, value] of Object.entries(json)) {
            if (key == "createdAt") {
                continue
            }
            if (key == "updatedAt") {
                // let date = Math.floor(Date.now() / 1000)
                let date = new Date().toISOString().slice(0, 19).replace('T', ' ');
                setSql.push(`${key}="${date}"`)
                continue
            }
            if (typeof value == "string") {
                let encodeValue = toLiteral(value)
                setSql.push(`${key}="${encodeValue}"`)

            } else {
                setSql.push(`${key}=${value}`)
            }

            //console.log([key, value]); // ['a', 1], ['b', 2], ['c', 3]
        }
        if(isSeo>0&&typeof seo !="undefined"){
            setSql.push(`seoTitle="${seo.title}||""`)
            setSql.push(`seoKeywords="${seo.keywords}||""`)
            setSql.push(`seoDesc="${seo.description}||""`)
        }
          console.log(setSql)

        let sql = `UPDATE list_${moduleId} SET ${setSql.join(",")} WHERE id=${id}`

        const manager = getManager();
        await manager.query(sql)
        return true
    }
    @Query(() => Content)
    
    async list(
        @Arg('id', () => Int) id: number,
        @Arg('projectIdentifier', () => String) projectIdentifier: string,
      
    ): Promise<Content | Boolean> {
        //根据id来查询项目，模型
        const project = await Project.findOne({ identifier: projectIdentifier });
       if (!project) return false
        const {moduleId,isSeo} = project      
        const manager = getManager();
        // const qb = getConnection().getRepository(Module).createQueryBuilder("p")
        // const data = await qb.getMany()
        const data = await manager.query(`SELECT * FROM list_${moduleId} WHERE id = ${id} LIMIT 1`)
        if (data[0]) {
            let result =  data[0]
            const {seoDesc,seoKeywords,seoTitle,...other} = result
            let seo = null
            if(isSeo>0&&(seoDesc||seoKeywords||seoTitle)){
                seo={
                    title:seoTitle||"",
                    keywords:seoKeywords||"",
                    description:seoDesc||""
                } 
            }
            return { content: other,seo}
        } else {
            return false;
        }
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteList(
        @Arg("id", () => Int) id: number,
        @Arg('projectIdentifier', () => String, { nullable: true }) projectIdentifier: string,
        @Arg('moduleId', () => Int, { nullable: true }) moduleId: number
    ): Promise<boolean> {
        if (!moduleId) {
            if (projectIdentifier) {
                const project = await Project.findOne({ identifier: projectIdentifier });
                if (!project) {
                    return false
                } else {
                    moduleId = project.moduleId
                }
            } else {
                return false
            }
        }
        const manager = getManager();
        const data = await manager.query(`DELETE  FROM list_${moduleId} WHERE id = ${id}`)
        console.log(data)
        return true;
    }

    @Query(() => Paginated,{nullable:true})
    async lists(
        //@Arg('moduleId', () => Int, { nullable: true }) moduleId: number,
        @Arg('identifier', () => String) identifier: string,
        //@Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('limit', () => Int, { nullable: true }) limit: number = 20,
        @Arg("page", () => Int, { nullable: true }) page: number = 1,
    ): Promise<Paginated | null> {
        let whereSql = `WHERE `;
        let columnSql = 'id,title,projectId,categoryId,createdAt'
        const project = await Project.findOne({ identifier: identifier });
        if(!project) return null
        const {moduleId,id:projectId} = project 
        console.log(moduleId)
        whereSql += `projectId = ${projectId}`
        //子查询优化
        //根据id来查询项目，模型
        const realLimit = Math.min(100, limit);
        //let totalPageNum = (totalRecord +pageSize - 1) / pageSize;
        const manager = getManager();

        if (categoryId) {
            whereSql += ` AND categoryId = ${categoryId}`
        }
        let offset = (page - 1) * realLimit;
        let total = 0;

        //const data =  await manager.query(`SELECT * FROM list_${moduleId} LIMIT ${limit}`)
        let orderSql = `ORDER BY id desc`

        //子查询优化
        if(project.listFields){
            columnSql += `,${project.listFields}`
        }
        
        //let optimtSql = `and id<=(select id from list_${moduleId}  ${whereSql} ${orderSql} limit ${offset},1)`
        let sql = `SELECT ${columnSql} FROM list_${moduleId} ${whereSql} ${orderSql} LIMIT ${offset},${realLimit}`
        //默认读取全部,自定义。通过读取项目的list来获取。默认 id,title,createdAt,sort
        const data = await manager.query(sql)
        let totalRes = await manager.query(`SELECT COUNT(id) FROM list_${moduleId}  ${whereSql}`)

        total = parseInt(totalRes[0]['COUNT(id)'])

        // [WHERE Clause]
        // [LIMIT N][ OFFSET M]
        //let totalPage = Math.ceil((total +realLimit - 1) / realLimit);
        let totalPage = Math.ceil((total) / realLimit);
        console.log(total, realLimit, totalPage)
        let hasMore = page < totalPage
        // console.log(data)
        let result = data.map((item: any) => {
            console.log(item)
            const { id, title, projectId, categoryId, createdAt, ...other } = item

            // let other = JSON.stringify(others)

            // console.log(other)
            return { id, title, projectId, categoryId, createdAt, other }
        })
        console.log(result)

        return { lists: result, limit, page, hasMore, total, totalPage }
    }
}