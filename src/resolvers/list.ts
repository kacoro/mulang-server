import { List } from "../entities/List";
import { Resolver, Query, Arg, Int, Mutation, ObjectType, Field } from "type-graphql";

import {  getManager } from "typeorm";
// import GraphQLJSON, { GraphQLJSONObject } from 'graphql-type-json'
import GraphQLJSON from 'graphql-type-json'

@ObjectType()
class Content {
    @Field(() => GraphQLJSON)
    content: JSON
    
}

@ObjectType()
class Paginated {
    @Field(() => [GraphQLJSON])
    lists: JSON[]

    @Field(() => Int)
    page:number

    @Field(() => Int)
    limit:number
    
    @Field()
    hasMore: boolean;

    @Field()
    total:number

    @Field()
    totalPage:number
}

@Resolver(List)
export class ListResolver {
    
    @Mutation(()=>Boolean)
    async createList(
        @Arg('moduleId', () => Int) moduleId: number,
        @Arg('projectId', () => Int) projectId: number,
        @Arg('json', () => GraphQLJSON) json: JSON,

    ) {

        //更严谨的应该从模块中读取字段列
        let columns = `projectId`
        let values =  `${projectId}`
        for (let [key, value] of Object.entries(json)) {
            columns +=`,${key}`
            console.log(typeof value)
            if(typeof value=="string"){
                values +=`,"${value}"`
            }else{
                values +=`,${value}`
            }
            //console.log([key, value]); // ['a', 1], ['b', 2], ['c', 3]
          }
          console.log(columns,values)
          let sql = `
          INSERT INTO  list_${moduleId} (${columns})
          VALUES
          (${values})
          `              
           console.log(sql)            
        const manager = getManager();
        await manager.query(sql)
        return true
    }

    @Mutation(()=>Boolean)
    async updateList(
        @Arg('id', () => Int) id: number,
        @Arg('moduleId', () => Int) moduleId: number,
        // @Arg('projectId', () => Int) projectId: number,
        @Arg('json', () => GraphQLJSON) json: JSON,

    ) {
        //更严谨的应该从模块中读取字段列
        let setSql = []
        for (let [key, value] of Object.entries(json)) {
          
            if(typeof value=="string"){
                setSql.push(`${key}="${value}"`)
              
            }else{
                setSql.push(`${key}=${value}`)
            }
            //console.log([key, value]); // ['a', 1], ['b', 2], ['c', 3]
          }
    
          let sql = `UPDATE list_${moduleId} SET ${setSql.join(",")} WHERE id=${id}`              
                
        const manager = getManager();
        await manager.query(sql)
        return true
    }
    @Query(() => Content)
    async list(
         @Arg('id', () => Int) id: number,
         @Arg('moduleId', () => Int) moduleId: number
    ): Promise<Content|Boolean> {
        //根据id来查询项目，模型
        const manager = getManager();
        // const qb = getConnection().getRepository(Module).createQueryBuilder("p")
        // const data = await qb.getMany()
        const data =  await manager.query(`SELECT * FROM list_${moduleId} WHERE id = ${id} LIMIT 1`)
        if(data[0]){
            return {content:data[0] }
        }else{
            return false;
        }
        // [WHERE Clause]
        // [LIMIT N][ OFFSET M]
        // ORDER BY field1 [ASC [DESC][默认 ASC]], [field2...] [ASC [DESC][默认 ASC]]
        console.log(data)
       
    }

    @Mutation(() => Boolean)
    async deleteList(
        @Arg("id", () => Int) id: number,
        @Arg('moduleId', () => Int) moduleId: number
    ): Promise<boolean> {
        
        const manager = getManager();
        const data =  await manager.query(`DELETE  FROM list_${moduleId} WHERE id = ${id}`)
        console.log(data)
        return true;
    }

    @Query(() => Paginated)
    async lists(
         @Arg('moduleId', () => Int) moduleId: number,
         @Arg('projectId', () => Int) projectId: number,
         @Arg('categoryId', () => Int,{ nullable: true }) categoryId: number,
         @Arg('limit', () => Int,{ nullable: true }) limit: number=20,
         @Arg("page", () => Int,{ nullable: true }) page: number =1,
    ): Promise<Paginated> {

        //子查询优化
        //根据id来查询项目，模型
        const realLimit = Math.min(100, limit);
        //let totalPageNum = (totalRecord +pageSize - 1) / pageSize;
        const manager = getManager();
        let whereSql = `WHERE projectId = ${projectId}`
        if(categoryId){
            whereSql += ` AND categoryId = ${categoryId}`
        }
       let offset = (page-1)*realLimit;
      let total = 0;
     
        //const data =  await manager.query(`SELECT * FROM list_${moduleId} LIMIT ${limit}`)
        let orderSql  = `ORDER BY id desc`

        //子查询优化
        //let optimtSql = `and id<=(select id from list_${moduleId}  ${whereSql} ${orderSql} limit ${offset},1)`
        let sql = `SELECT * FROM list_${moduleId} ${whereSql} ${orderSql} LIMIT ${offset},${realLimit}`
        
        const data =  await manager.query(sql)
        let totalRes =  await manager.query(`SELECT COUNT(id) FROM list_${moduleId}  ${whereSql}`)
       
        total = parseInt(totalRes[0]['COUNT(id)'])
        
        // [WHERE Clause]
        // [LIMIT N][ OFFSET M]
        //let totalPage = Math.ceil((total +realLimit - 1) / realLimit);
        let totalPage = Math.ceil((total) / realLimit);
        console.log(total,realLimit,totalPage)   
        let hasMore = page < totalPage
        console.log(data)
        return {lists:data,limit,page,hasMore,total,totalPage}
    }
}