
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column,  Entity, ManyToOne, OneToOne, PrimaryGeneratedColumn } from "typeorm";
import { Category } from "./Category";
import { Module } from "./Module";

@ObjectType()
@Entity()
export class Project extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn( {comment:'自增ID，也是应用ID'})
  id!: number;

  @Field()
  @Column( {comment:'名称'})  
  title!: string;

  @Field({})
  @Column({comment:"标识",unique:true}) 
  identifier:string

  @Field()
  @Column({comment:"指定模型ID，为0表页面空白",nullable: true})
  moduleId:number

  @Field(()=>Module)
  @ManyToOne(() => Module,(module) =>module.projects,{onDelete:'CASCADE'})
  module:Module

  @Field()
  @Column({comment:"绑定根分类ID",default:0}) //绑定分类
  categoryId:number

  @OneToOne(() => Category,(category) =>category)
  category:Category

  @Field({nullable: true})
  @Column({ type: "longtext" ,comment:'备注',nullable: true})
  note: string ; //备注

  // @Field()
  // @Column({comment:"上一级ID",default:0})
  // parent_id:number

  // @Field()
  // @Column({comment:"网站ID"})  //用于多站点，必填 暂时不实现
  // site_id:number

  @Field()
  @Column({comment:"后台别称",default:""})
  aliasTitle:string

  @Field()
  @Column({comment:"排序，值越小越往前靠",default:0})
  sort:number
  
  @Field()
  @Column({comment:"0不使用1使用",default:0})
  status:number

  @Field()
  @Column({comment:"列表读取长度，如为空读全部",default:""})
  listFields:string

  @Field()
  @Column({comment:"封面页",default:""})
  tplIndex:string

  @Field()
  @Column({comment:"列表页",default:""})
  tplList:string

  @Field()
  @Column({comment:"详细页",default:""})
  tplContent:string

  @Field()
  @Column({comment:"发布页模板",default:""})
  postTpl:string

  @Field()
  @Column({comment:"图标",default:""})
  ico:string


  @Field()
  @Column({comment:"是否自定义标识",default:true})
  isIdentifier:boolean
 
 
  @Field()
  @Column({comment:"主题别名",default:""})  //在使用模块时，会有一个必填选项，即主题，您可在这里设置别名
  themeTitle:string
  @Field()
  @Column({comment:"主题备注",default:""})  //针对主题的别名设置相应的备注信息
  themeNote:string

  @Field()
  @Column({comment:"0表示不限制，每页显示数量",default:10})  //默认主题数
  psize :number

  @Field()
  @Column({comment:"会员ID号，为0表示管理员维护",default:0})
  userId :string

  @Field()
  @Column({comment:"是否使用seo,类型 0不使用 1启用非必填默认隐藏，2启用非必填默认显示，3启用必填",default:0})
  isSeo:number
  
  @Field()
  @Column({comment:"SEO标题",default:""})
  seoTitle:string
  
  @Field()
  @Column({comment:"SEO关键字",default:""})
  seoKeywords:string
  @Field()
  @Column({comment:"SEO描述",default:""})
  seoDesc :string

  @Field()
  @Column({comment:"是否启用子主题功能",default:false})
  subTopics :boolean
  @Field()
  @Column({comment:"是否支持搜索",default:false})
  isSearch :boolean
  @Field()
  @Column({comment:"必填Tag",default:false})
  isTag :boolean
  @Field()
  @Column({comment:"0不启用电商，1启用电商",default:false})
  isBiz :boolean
  @Field()
  @Column({comment:"是否绑定会员",default:false})
  isUserid:boolean
  @Field()
  @Column({comment:"是否自定义内容模板",default:false})
  isTplContent:boolean
  

  @Field()
  @Column({comment:"默认货币ID",default:""})
  currencyId :string
  @Field()
  @Column({comment:"管理员备注，给编辑人员使用的",default:""})
  adminNote :string
  @Field()
  @Column({comment:"0显示1隐藏",default:false})
  hidden:boolean

  @Field()
  @Column({comment:"发布模式，0不启用1启用",default:false})
  postStatus:boolean
  @Field()
  @Column({comment:"启用评论功能",default:false})
  commentStatus:boolean
 
  @Field()
  @Column({comment:"通知管理员邮件模板",default:""})
  etplAdmin:string
  @Field()
  @Column({comment:"发布邮件通知会员模板",default:""})
  etplUser:string
  @Field()
  @Column({comment:"评论邮件通知管理员模板",default:""})
  etplComment_admin:string
  @Field()
  @Column({comment:"评论邮件通知会员",default:""})
  etplComment_user:string
  @Field()
  @Column({comment:"1启用主题属性0不启用",default:""})
  isAttr:string
  @Field()
  @Column({comment:"自身Tag设置",default:""})
  tag:string
  @Field()
  @Column({comment:"0分类单选1分类支持多选",default:""})
  cateMultiple:string
  @Field()
  @Column({comment:"产品属性，0不使用1使用",default:""})
  bizAttr:string
  @Field()
  @Column({comment:"运费模板ID",default:""})
  freight:string

  

  @Field()
  @Column({comment:"网站ID",default:""})
  style:string

  @Field()
  @Column({comment:"是否直接访问前台",default:""})
  isFront:string
  @Field()
  @Column({comment:"0接口不可访问，1可访问",default:""})
  isApi :string
  @Field()
  @Column({comment:"API接口读取的数量",default:""})
  psizeApi:string
  @Field()
  @Column({comment:"发布时间间隔限制，0表示不限制",default:""})
  limitTimes:string
  @Field()
  @Column({comment:"相似度值限制，0表示不限制",default:0})
  limitSimilar:number


  @Field()
  @Column({comment:"1启用库存，0禁用库存",default:false})
  isStock:boolean
  @Field()
  @Column({comment:"产品全球价格设置",default:""})
  worldLocation:string

}