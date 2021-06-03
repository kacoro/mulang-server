import { Resolver, Arg, Int, Mutation, Ctx, Query, FieldResolver, Root } from "type-graphql";
import { MyContext } from "../types";
import {   getManager, Not } from "typeorm";
import { Site } from "../entities/Site";
import { Seo } from "../entities/Seo";
import GraphQLJSON from "graphql-type-json";
@Resolver(Site)
export class SiteResolver {
   
    @FieldResolver(() => Seo, { nullable: true })
    seo(
        @Root() root: Site,
    ): Seo {
        return {
            title: root.seoTitle  || "",
            keywords: root.seoKeywords  || "",
            description: root.seoDesc || ""
        }
    }

    @Mutation(() => Site, { nullable: true }) // ()=> [Post]
    async createSite(
        @Arg('title', () => String) title: string,
        @Arg('identifier', () => String) identifier: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('status', () => Boolean, { nullable: true }) status: boolean,
        @Arg('copyright', () => String, { nullable: true }) copyright: string,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('logo', () => String, { nullable: true }) logo: string,
        @Arg('shortcut', () => String, { nullable: true }) shortcut: string,
        // @Arg('table', () => String, { nullable: true }) table: string,
        @Ctx() { }: MyContext
    ): Promise<Site | null> { //: Promise<Post[]>
        const csub = new Site();
        const manager = getManager();
        const count = await Site.createQueryBuilder("s").getCount()
        csub.title = title;
        csub.identifier = identifier;
        csub.status = status;
        csub.copyright = copyright;
        csub.sort = sort;
        csub.note = note;
        csub.logo = logo;
        csub.shortcut = shortcut;
        if (typeof seo != "undefined") {
            csub.seoTitle = seo.title || ""
            csub.seoKeywords = seo.keywords || ""
            csub.seoDesc = seo.description || ""
        }
        if(count==0){
            csub.isDefault = true
        }
        return await manager.save(csub);

    }

    @Query(() => Site, { nullable: true })
    async site(
        @Arg('id', () => Int, { nullable: true }) id: number,
        @Arg('identifier', () => String, { nullable: true }) identifier: string,
    ): Promise<Site | undefined> {
        // return Post.findOne(id, { relations: ["creator"] });
        if (id) {
            return await Site.findOne(id);
        } else if (identifier) {
            return Site.findOne({ where: { identifier: identifier } });
        } else {
            return await Site.findOne({where:{isDefault:true}});
        }
    }

    @Query(() => [Site])
    async sites(
        // @Arg('id', () => Int, { nullable: true }) id: number
    ): Promise<Site[]> {
        const qb = Site.getRepository().createQueryBuilder("p")
        const data = await qb.getMany()
        return data
    }

    @Mutation(() => Boolean)
    async deleteSite(
        @Arg("id", () => Int) id: number,
        @Ctx() { }: MyContext
    ): Promise<boolean> {
        //const count = await Site.createQueryBuilder("s").getCount()
        const site = await Site.findOne(id)
        if(site?.isDefault!=true){
              await Site.delete({ id }) 
              return true
        }else{
            return false;
        }
    }

    @Mutation(() => Boolean, { nullable: true })
    async setDefaultSite(
        @Arg("id", () => Int) id: number,
        @Ctx() { }: MyContext
    ): Promise<Boolean> {
        
        const count = await Site.createQueryBuilder("s").getCount()
        const site = await Site.findOne(id)
        console.log(count,site)
        if(site&&count>1){//只有不是默认网站且站点数量大于1的时候才可以修改
            //Site.createQueryBuilder().update
            console.log(count,site.isDefault)
            await Site.update({id:Not(id)},{ isDefault:false})
            //await getConnection().createQueryBuilder().update(Site).set({isDefault:false}).execute();
            await Site.update({id},{isDefault:true})
            return true
        }
        return false
    }
    @Mutation(() => Site, { nullable: true })
    async updateSite(
        @Arg("id", () => Int) id: number,
        @Arg('title', () => String, { nullable: true }) title: string,
        @Arg('identifier', () => String, { nullable: true }) identifier: string,
        @Arg('sort', () => Int, { nullable: true }) sort: number,
        @Arg('status', () => Boolean, { nullable: true }) status: boolean,
        @Arg('note', () => String, { nullable: true }) note: string,
        @Arg('copyright', () => String, { nullable: true }) copyright: string,
        @Arg('logo', () => String, { nullable: true }) logo: string,
        @Arg('shortcut', () => String, { nullable: true }) shortcut: string,
        @Arg('seo', () => GraphQLJSON, { nullable: true }) seo: Seo,
        @Ctx() { }: MyContext
    ): Promise<Site | null> {
        
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

        if (typeof sort != "undefined") {
            condition = Object.assign(condition, { sort })
        }
        if (typeof status != "undefined") {
            condition = Object.assign(condition, { status })
        }

        if (typeof copyright != "undefined") {
            condition = Object.assign(condition, { copyright })
        }
        if (typeof logo != "undefined") {
            condition = Object.assign(condition, { logo })
        }
        if (typeof shortcut != "undefined") {
            condition = Object.assign(condition, { shortcut })
        }
        

        if (typeof seo != "undefined") {
            condition = Object.assign(condition, { seoTitle: seo.title || "" })
            condition = Object.assign(condition, { seoKeywords: seo.keywords || "" })
            condition = Object.assign(condition, { seoDesc: seo.description || "" })
        }

        const result = await Site.update({
            id
        }, condition)
        if (result.affected) {
            const site = await Site.findOne(id)
            if (site) {
                return site
            }
        }

        return null;
    }

}

