import { Resolver, Arg, Int, Mutation, Ctx, Query, UseMiddleware } from "type-graphql";
import { MyContext } from "../types";
import { getConnection, getManager } from "typeorm";
import { Field } from "../entities/Field";
import { isAuth } from "../middleware/isAuth";
@Resolver(Field)
export class FieldResolver {
    @Mutation(() => Field) // ()=> [Post]
    @UseMiddleware(isAuth)
    async createField(
        @Arg('moduleId', () => String, { nullable: true }) moduleId: string | null,
        @Arg('title', () => String) title: string,
        @Arg('identifier', () => String) identifier: string,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('type', () => String, { nullable: true }) type: string,
        @Arg('formType', () => String, { nullable: true }) formType: string,
        @Arg('formExt', () => String, { nullable: true }) formExt: string,
        @Arg('format', () => String, { nullable: true }) format: string,
        @Arg('content', () => String, { nullable: true }) content: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('onlyone', () => Boolean, { nullable: true }) onlyone: boolean,
        @Arg('isFront', () => Boolean, { nullable: true }) isFront: boolean,
        @Arg('search', () => Int, { nullable: true }) search: number,
        @Arg('searchSeparaStor', () => String, { nullable: true }) searchSeparaStor: string,

        // @Arg('table', () => String, { nullable: true }) table: string,
        @Ctx() { }: MyContext
    ): Promise<Field> { //: Promise<Post[]>
        let csub = new Field();
        const manager = getManager();
        csub = Object.assign(csub, { moduleId, title, identifier, note, type, formType, formExt, format, sort, onlyone, content, isFront, search, searchSeparaStor })

        if (moduleId) {
            //创建字段时，修改表
            let sql = `ALTER TABLE list_${moduleId} ADD ${identifier} `
            switch (type) {
                case "varchar":
                    sql += ` ${type}(255)`
                    break;
                case "int":
                    sql += ` ${type}(11)`
                    break;
                case "date":
                case "datetime":
                case "longtext":
                case "longblob":
                    sql += ` ${type}`
                    break;
                default:
                    sql += ` varchar(255)`
                    break;
            }

            sql += ` COMMENT '${title}'`
            if (content) {
                sql += ` SET DEFAULT ${content}`
            }
            await manager.query(sql);
        }
        const data = await manager.save(csub)
        return data;
    }

    @Query(() => Field, { nullable: true })
    field(
        @Arg('id', () => Int) id: number,
    ): Promise<Field | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        return Field.findOne(id);
    }

    @Query(() => [Field])
    async fields(
        @Arg('moduleId', () => String, { nullable: true }) moduleId: string
    ): Promise<Field[]> {
        let qb = getConnection().getRepository(Field).createQueryBuilder("p").orderBy("sort", "ASC")
        if (moduleId) {
            qb = qb.where({ moduleId })
        } else {
            qb = qb.where({ moduleId: "" })
        }
        const data = await qb.getMany()

        return data
    }

    @Query(() => [Field])
    async mFields(
        @Arg('moduleId', () => String, { nullable: true }) moduleId: string
    ): Promise<Field[]> {
        let qb = getConnection().getRepository(Field).createQueryBuilder("p")
        if (moduleId) {
            qb = qb.where({ moduleId }).orderBy({sort:"ASC"})
        }
        const data = await qb.getMany()

        return data
    }

    @Mutation(() => Boolean)
    @UseMiddleware(isAuth)
    async deleteField(
        @Arg("id", () => Int) id: number,
        @Ctx() {loaders }: MyContext
    ): Promise<boolean> {
        //删除字段的时候需要处理相应的数据列
        const manager = getManager();
        const data = await Field.findOne(id);
        if (data?.moduleId) {
            let sql = `ALTER TABLE list_${data.moduleId} Drop ${data.identifier} `
            await manager.query(sql);
        }
        loaders.FieldLoader.clear(id)  
        //删除字段时需要删除module的layout和project的listFields

        await Field.delete({ id })
        return true;
    }

    @Mutation(() => Field, { nullable: true })
    @UseMiddleware(isAuth)
    async updateField(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Arg('identifier', () => String, { nullable: true }) identifier: string,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('type', () => String, { nullable: true }) type: string,
        @Arg('formType', () => String, { nullable: true }) formType: string,
        @Arg('formExt', () => String, { nullable: true }) formExt: string,
        @Arg('format', () => String, { nullable: true }) format: string,
        @Arg('content', () => String, { nullable: true }) content: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('onlyone', () => Boolean, { nullable: true }) onlyone: boolean,
        @Arg('isFront', () => Boolean, { nullable: true }) isFront: boolean,
        @Arg('search', () => Int, { nullable: true }) search: number,
        @Arg('searchSeparaStor', () => String, { nullable: true }) searchSeparaStor: string,
        @Ctx() {loaders }: MyContext
    ): Promise<Field | null> {
        let condition = {} //管理员不需要过滤
        if (typeof title != "undefined") {
            condition = Object.assign(condition, { title })
        }
        if (typeof identifier != "undefined") {
            condition = Object.assign(condition, { identifier })
        }

        if (typeof note != "undefined") {
            condition = Object.assign(condition, { note })
        }
        if (typeof type != "undefined") {
            condition = Object.assign(condition, { type })
        }
        if (typeof formType != "undefined") {
            condition = Object.assign(condition, { formType })
        }
        if (typeof formExt != "undefined") {
            condition = Object.assign(condition, { formExt })
        }
        if (typeof format != "undefined") {
            condition = Object.assign(condition, { format })
        }
        if (typeof sort != "undefined") {
            condition = Object.assign(condition, { sort })
        }
        if (typeof onlyone != "undefined") {
            condition = Object.assign(condition, { onlyone })
        }
        if (typeof content != "undefined") {
            condition = Object.assign(condition, { content })
        }
        if (typeof isFront != "undefined") {
            condition = Object.assign(condition, { isFront })
        }
        if (typeof search != "undefined") {
            condition = Object.assign(condition, { search })
        }
        if (typeof searchSeparaStor != "undefined") {
            condition = Object.assign(condition, { searchSeparaStor })
        }
        //更新的时候清楚缓存
        loaders.FieldLoader.clear(id)  
        const result = await Field.update({
            id
        }, condition)
        if (result.affected) {
            const field = await Field.findOne(id)
            if (field) {
                //只有传递了title,type,时才能修改
                if (typeof type != "undefined"&&typeof identifier != "undefined"&&typeof title != "undefined"&&field.moduleId) {//更新字段
                    const manager = getManager();
                    //创建字段时，修改表
                    let sql = `ALTER TABLE list_${field.moduleId} MODIFY COLUMN ${identifier} `
                    switch (type) {
                        case "varchar":
                            sql += ` ${type}(255)`
                            break;
                        case "int":
                            sql += ` ${type}(11)`
                            break;
                        case "date":
                        case "datetime":
                        case "longtext":
                        case "longblob":
                            sql += ` ${type}`
                            break;
                        default:
                            sql += ` varchar(255)`
                            break;
                    }

                    sql += ` COMMENT '${title}'`
                    if (content) {
                        sql += ` SET DEFAULT ${content}`
                    }
                    await manager.query(sql);
                }
                return field
            }
        }
        return null;
    }

}

