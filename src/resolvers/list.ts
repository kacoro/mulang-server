import { List } from "../entities/List";
import { Resolver, Query, Arg, Int, Mutation, ObjectType, Field, UseMiddleware, Ctx, FieldResolver, Root, } from "type-graphql";
import dayjs from "dayjs"
// import GraphQLJSON, { GraphQLJSONObject } from 'graphql-type-json'
import GraphQLJSON from 'graphql-type-json'
import { Project } from "../entities/Project";
import { Seo } from "../entities/Seo";
import { isAuth } from "../middleware/isAuth";
import { MyContext } from "../types";
import { User } from "../entities/User";
import { Category } from "../entities/Category";
import findTreeIds from "../utils/treetoArray";
import { convert } from 'html-to-text';
import { Manager } from "../index";
// import { createUnionType } from "type-graphql";

interface dictType {
    [key: string]: string,
}

function toLiteral(str: string) {
    var dict = { '\b': 'b', '\t': 't', '\n': 'n', '\v': 'v', '\f': 'f', '\r': 'r' } as dictType;
    return str.replace(/([\\'"\b\t\n\v\f\r])/g, function (_$0: any, $1: string) {
        return '\\' + (dict[$1] || $1);
    });

}

@ObjectType()
class PrevNext {
    @Field(() => Int)
    id: number

    @Field(() => String)
    title: number

    @Field(() => String)
    publishTime:string
    
}

@ObjectType()
class Content {
    @Field(() => GraphQLJSON)
    content: JSON

    @Field(() => Seo, { nullable: true })
    seo: Seo | null

    @Field(() => PrevNext, { nullable: true })
    prev?: PrevNext | null

    @Field(() => PrevNext, { nullable: true })
    next?: PrevNext | null

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

    @FieldResolver(() => String, { nullable: true })
    imgSnippet(
        @Root() root: any
    ): string | null {

        // var reg = /<img.+?src=('|")?([^'"]+)('|")?(?:\s+|>)/gim;
        // var imgsrcArr = [];
        // while (let tem = reg.exec(htmlstr)) {  
        //     imgsrcArr.push(tem[2]);  
        // }  
        if (!root?.other?.thumb) {//如果不存在，从内容中截取
            if (root?.other?.content) {
                var data = '';
                root?.other?.content.replace(/<img [^>]*src=['"]([^'"]+)[^>]*>/, function (_match: any, capture: string) {
                  data = capture;
                });
               return data
            }
        }

        return null
    }

    @FieldResolver(() => String, { nullable: true })
    textSnippet(
        @Root() root: any
    ): string | null {
        if (root?.other?.note) {//如果存在
            return root.other.note.slice(0, 50)
        } else {
            if (root?.other?.content) {
                //将content转成纯文本
                let text = convert(root.other.content, { wordwrap: 50 }).slice(0, 50)
                return text
            }
        }

        return null
    }

    @Mutation(() => Int, { nullable: true })
    //@UseMiddleware(isAuth)
    async createList(
        //@Arg('moduleId', () => Int, { nullable: true }) moduleId: number,
        @Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('projectIdentifier', () => String, { nullable: true }) projectIdentifier: string,
        @Arg('json', () => GraphQLJSON) json: JSON,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
        @Ctx() { payload}: MyContext
    ): Promise<number | null> {
        let project = null
        if (projectId) {
            project = await Project.findOneBy({ id: projectId });
        } else if (projectIdentifier) {
            project = await Project.findOneBy({ identifier: projectIdentifier });
        }

        if (!project) {
            return null
        }

        //判断是否允许前台发布 isFront //如果不允许则需要验证用户是否登录
        if (!project.isFront) {
            if (!payload.sub) {
                throw new Error('not authenticated')
            }
            const user = await User.findOneBy({ id: payload.sub});
            if (!user) {
                throw new Error('not authenticated')
            }
        }

        const { moduleId, id, isSeo } = project
        projectId = id
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
        }
        if (isSeo > 0 && typeof seo != "undefined") {
            columns += `,seoTitle,seoKeywords,seoDesc`
            values += `,"${seo.title || ''}","${seo.keywords || ''}","${seo.description || ''}"`
        }
        let sql = `
          INSERT INTO  list_${moduleId} (${columns})
          VALUES
          (${values})
          `
        const result = await Manager.query(sql)
        if (result?.insertId) {
            return result.insertId
        } else {
            return null
        }
    }

    @Mutation(() => Boolean)
    async updateListHits(
        @Arg('projectIdentifier', () => String, { nullable: true }) projectIdentifier: string,
        @Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('id', () => Int) id: number,
    ) {
        let project = null
        if (projectId) {
            project = await Project.findOneBy({ id: projectId });
        } else if (projectIdentifier) {
            project = await Project.findOneBy({ identifier: projectIdentifier });
        }

        if (!project) { return false }
        const { moduleId } = project

        if (!moduleId) {
            return false
        }
        let sql = `UPDATE list_${moduleId} SET hits=hits +1  WHERE id=${id}`

        await Manager.query(sql)
        return true
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async updateList(
        @Arg('id', () => Int) id: number,
        @Arg('projectIdentifier', () => String, { nullable: true }) projectIdentifier: string,
        @Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('json', () => GraphQLJSON) json: JSON,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
    ) {
        let project = null
        if (projectId) {
            project = await Project.findOneBy({ id: projectId });
        } else if (projectIdentifier) {
            project = await Project.findOneBy({ identifier: projectIdentifier });
        }

        if (!project) {
            return false
        }
        const { moduleId, isSeo } = project

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
            if (key == "publishTime") {
                if(value){
                    let date = new Date(value).toISOString().slice(0, 19).replace('T', ' ');
                    //let date = new Date(value).toISOString(); 
                    setSql.push(`${key}="${date}"`)
                   
                }
                continue
              
            }
            if (typeof value == "string") {
                let encodeValue = toLiteral(value)
                setSql.push(`${key}="${encodeValue}"`)

            } else {

                setSql.push(`${key}=${value}`)
            }

        }
        if (isSeo > 0 && typeof seo != "undefined") {
            setSql.push(`seoTitle="${seo.title || ""}"`)
            setSql.push(`seoKeywords="${seo.keywords || ""}"`)
            setSql.push(`seoDesc="${seo.description || ""}"`)
        }

        let sql = `UPDATE list_${moduleId} SET ${setSql.join(",")} WHERE id=${id}`

       
        await Manager.query(sql)
        return true
    }
    @Query(() => Content)

    async list(
        @Arg('id', () => Int) id: number,
        @Arg('projectIdentifier', () => String) projectIdentifier: string,
        @Arg('isPrevNext', () => Boolean, { nullable: true }) isPrevNext: boolean,

    ): Promise<Content | Boolean> {
        //根据id来查询项目，模型
        const project = await Project.findOneBy({ identifier: projectIdentifier });
        if (!project) return false
        const { moduleId, isSeo, orderBy, id: projectId } = project
        // const qb = AppDataSource.getRepository(Module).createQueryBuilder("p")
        // const data = await qb.getMany()
        const data = await Manager.query(`SELECT * FROM list_${moduleId} WHERE id = ${id} LIMIT 1`)
        if (data[0]) {
            let result = data[0]
            const { seoDesc, seoKeywords, seoTitle, ...other } = result
            let seo = null
            if (isSeo > 0 && (seoDesc || seoKeywords || seoTitle)) {
                seo = {
                    title: seoTitle || "",
                    keywords: seoKeywords || "",
                    description: seoDesc || ""
                }
            }
            //isPrevNext
            if (isPrevNext) {
                let whereSql = `WHERE `;
                whereSql += `projectId = ${projectId} `
                let orderKey = 'id'
                //let orderSql = `ORDER BY id ASC`
                if (orderBy) {
                    //orderSql = `ORDER BY ${orderBy}`
                    orderKey = orderBy.split(',')[0].replace(" DESC", "").replace(" ASC", "")
                }
                if (other.categoryId) {
                    //whereSql += ` AND categoryId = ${categoryId}`
                    let cateSql = ` AND categoryId = ${other.categoryId}`
                    whereSql += cateSql
                }

                function getNextPrevSql(orderKey: string, params: '<' | '>') {
                    if (orderKey == "publishTime") {
                        //let publishTime = new Date(other[orderKey]).getTime()
                        let publishTime = dayjs(other[orderKey]).format('YYYY-MM-DD HH:mm:ss')
                        return ` AND UNIX_TIMESTAMP(${orderKey}) ${params} UNIX_TIMESTAMP("${publishTime}")`

                    } else {
                        return ` AND ${orderKey} ${params} ${other[orderKey]}`
                    }
                }

                let prevWhere = whereSql + getNextPrevSql(orderKey, '>')
                let nextWhere = whereSql + getNextPrevSql(orderKey, '<')


                let prevSql = `SELECT id,title,publishTime FROM list_${moduleId} ${prevWhere} order by ${orderKey} asc limit 1`

                const prevData = await Manager.query(prevSql)

                let nextSql = `SELECT id,title,publishTime FROM list_${moduleId} ${nextWhere} order by ${orderKey} desc limit 1`
                const nextData = await Manager.query(nextSql)

                return { content: other, seo, prev: prevData[0], next: nextData[0] }
            }

            return { content: other, seo }
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
                const project = await Project.findOneBy({ identifier: projectIdentifier });
                if (!project) {
                    return false
                } else {
                    moduleId = project.moduleId
                }
            } else {
                return false
            }
        }
        await Manager.query(`DELETE  FROM list_${moduleId} WHERE id = ${id}`)
      
        return true;
    }

    @Query(() => [List])
    async listsByIds(
        @Arg('ids', () => String) ids: string,
        @Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('projectIdentifier', () => String, { nullable: true }) projectIdentifier: string,
    ): Promise<List[] | null> {
        if (!ids) return []
        let project = null
        if (projectId) {
            project = await Project.findOneBy({ id: projectId });
        } else if (projectIdentifier) {
            project = await Project.findOneBy({ identifier: projectIdentifier });
        }
        if (!project) return []
        let whereSql = `WHERE `;
        let columnSql = 'id,title,projectId,categoryId,createdAt'
        const { moduleId, listFields } = project
        // whereSql += `projectId = ${projectId}`
        if (listFields) {
            columnSql += `,${listFields}`
        }
        var reg=/,$/gi;
        let filterIds = ids.replace(reg,"");
        // whereSql += ` find_in_set(id,${ids})`
        whereSql += `id in (${filterIds})`
        let orderSql = `ORDER BY id ASC`
        let sql = `SELECT ${columnSql} FROM list_${moduleId} ${whereSql} ${orderSql}`
        const data = await Manager.query(sql)

        let result = data.map((item: any) => {
            //console.log(item)
            const { id, title, projectId, categoryId, createdAt, ...other } = item
            let createTime = dayjs(createdAt).format('YYYY-MM-DD HH:mm:ss')
            // let other = JSON.stringify(others)
            
            // console.log(other)
            return { id, title, projectId, categoryId, createdAt, createTime, other }
        })

        return result
    }



    @Query(() => Paginated, { nullable: true })
    async lists(
        //@Arg('moduleId', () => Int, { nullable: true }) moduleId: number,
        @Arg('identifier', () => String) identifier: string,
        //@Arg('projectId', () => Int, { nullable: true }) projectId: number,
        @Arg('categoryId', () => Int, { nullable: true }) categoryId: number,
        @Arg('limit', () => Int, { nullable: true }) limit: number = 20,
        @Arg("page", () => Int, { nullable: true }) page: number = 1
    ): Promise<Paginated | null> {
        let whereSql = `WHERE `;
        let columnSql = 'id,title,projectId,categoryId,createdAt'

        const project = await Project.findOneBy({ identifier: identifier });
        if (!project) return null
        const { moduleId, id: projectId } = project

        whereSql += `projectId = ${projectId} `

        //子查询优化
        //根据id来查询项目，模型
        const realLimit = Math.min(100, limit);
        //let totalPageNum = (totalRecord +pageSize - 1) / pageSize;

        if (categoryId) {
            //whereSql += ` AND categoryId = ${categoryId}`
            let cateSql = ` AND categoryId = ${categoryId}`
            //找到该分类下的子分类
            const parentCategory = await Category.findOneBy({ id: categoryId })
            if (parentCategory) {
                let cate = await Manager.getTreeRepository(Category).findDescendantsTree(parentCategory);


                if (cate) {
                    //    let idsArr =  cate.children.map(item=>{return item.id})
                    //    idsArr.push(categoryId)
                    let idsArr = findTreeIds(cate)

                    let ids = idsArr.join(',')
                    cateSql = ` AND categoryId in (${ids})`
                }
            }
            whereSql += cateSql

        }

        let offset = (page - 1) * realLimit;
        let total = 0;


        let orderSql = `ORDER BY id ASC`
        if (project.orderBy) {
            orderSql = `ORDER BY ${project.orderBy}`
        }
        //子查询优化
        if (project.listFields) {
            columnSql += `,${project.listFields}`
        }


        let sql = `SELECT ${columnSql} FROM list_${moduleId} l ${whereSql} ${orderSql} LIMIT ${offset},${realLimit}`
        //默认读取全部,自定义。通过读取项目的list来获取。默认 id,title,createdAt,sort
        const data = await Manager.query(sql)
        let totalRes = await Manager.query(`SELECT COUNT(id) FROM list_${moduleId}  ${whereSql}`)

        total = parseInt(totalRes[0]['COUNT(id)'])

        let totalPage = Math.ceil((total) / realLimit);
        // console.log(total, realLimit, totalPage)
        let hasMore = page < totalPage
        // console.log(data)
        let result = data.map((item: any) => {
            //console.log(item)
            const { id, title, projectId, categoryId, createdAt, ...other } = item
            let createTime = dayjs(createdAt).format('YYYY-MM-DD HH:mm:ss')
            // let other = JSON.stringify(others)
            // console.log(createTime)
            // console.log(other)
            return { id, title, projectId, categoryId, createdAt, createTime, other }
        })
        //console.log(result)

        return { lists: result, limit, page, hasMore, total, totalPage }
    }
}