
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column,  Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Module } from "./Module";

@ObjectType()
@Entity()
export class Project extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn( {comment:'自增ID，也是应用ID'})
  id!: number;

  @Field()
  @Column({comment:"标识"}) 
  identifier:string

  @Field()
  @Column( {comment:'名称'})  
  title!: string;

  @Field()
  @Column({comment:"指定模型ID，为0表页面空白"})
  moduleId:number

  @ManyToOne(() => Module,(module) =>module.projects)
  module:Module

  @Field()
  @Column({comment:"绑定根分类ID",default:0}) //绑定分类
  category:number

  // @Field()
  // @Column({comment:"上一级ID",default:0})
  // parent_id:number

  // @Field()
  // @Column({comment:"网站ID"})  //用于多站点，必填 暂时不实现
  // site_id:number

  @Field()
  @Column({comment:"后台别称"})
  aliasTitle:string

  @Field()
  @Column({comment:"排序，值越小越往前靠"})
  sort:number
  
  @Field()
  @Column({comment:"0不使用1使用"})
  status:number

  @Field()
  @Column({comment:"封面页"})
  tplIndex:number
  @Field()
  @Column({comment:"列表页"})
  tplList:number
  @Field()
  @Column({comment:"详细页"})
  tplContent:number

  @Field()
  @Column({comment:"是否自定义标识"})
  isIdentifier:string
  @Field()
  @Column({comment:"图标"})
  ico:string
  @Field()
  @Column({comment:"排序"})
  orderby:string
  @Field()
  @Column({comment:"主题别名"})  //在使用模块时，会有一个必填选项，即主题，您可在这里设置别名
  themeTitle:string
  @Field()
  @Column({comment:"主题备注"})  //针对主题的别名设置相应的备注信息
  themeNote:string

  @Field()
  @Column({comment:"0表示不限制，每页显示数量",default:10})  //默认主题数
  psize :number

  @Field()
  @Column({comment:"会员ID号，为0表示管理员维护"})
  userid :string

  @Field()
  @Column({comment:"SEO标题"})
  seoTitle:string
  
  @Field()
  @Column({comment:"SEO关键字"})
  seoKeywords:string
  @Field()
  @Column({comment:"SEO描述"})
  seoDesc :string

  @Field()
  @Column({comment:"是否启用子主题功能"})
  subTopics :string
  @Field()
  @Column({comment:"是否支持搜索"})
  isSearch :string
  @Field()
  @Column({comment:"必填Tag"})
  isTag :string
  @Field()
  @Column({comment:"0不启用电商，1启用电商"})
  isBiz :string
  @Field()
  @Column({comment:"是否绑定会员"})
  isUserid:string
  @Field()
  @Column({comment:"是否自定义内容模板"})
  isTplContent:string
  @Field()
  @Column({comment:"是否默认使用seo"})
  isSeo:string
  @Field()
  @Column({comment:"默认货币ID"})
  currencyId :string
  @Field()
  @Column({comment:"管理员备注，给编辑人员使用的"})
  adminNote :string
  @Field()
  @Column({comment:"0显示1隐藏"})
  hidden:string
  @Field()
  @Column({comment:"发布模式，0不启用1启用"})
  postStatus:string
  @Field()
  @Column({comment:"启用评论功能"})
  commentStatus:string
  @Field()
  @Column({comment:"发布页模板"})
  postTpl:string
  @Field()
  @Column({comment:"通知管理员邮件模板"})
  etplAdmin:string
  @Field()
  @Column({comment:"发布邮件通知会员模板"})
  etplUser:string
  @Field()
  @Column({comment:"评论邮件通知管理员模板"})
  etplComment_admin:string
  @Field()
  @Column({comment:"评论邮件通知会员"})
  etplComment_user:string
  @Field()
  @Column({comment:"1启用主题属性0不启用"})
  isAttr:string
  @Field()
  @Column({comment:"自身Tag设置"})
  tag:string
  @Field()
  @Column({comment:"0分类单选1分类支持多选"})
  cateMultiple:string
  @Field()
  @Column({comment:"产品属性，0不使用1使用"})
  bizAttr:string
  @Field()
  @Column({comment:"运费模板ID"})
  freight:string
  @Field()
  @Column({comment:"列表读取长度，如为空读全部"})
  listFields:string
  @Field()
  @Column({comment:"网站ID"})
  style:string
  @Field()
  @Column({comment:"是否直接访问前台"})
  isFront:string
  @Field()
  @Column({comment:"0接口不可访问，1可访问"})
  isApi :string
  @Field()
  @Column({comment:"API接口读取的数量"})
  psizeApi:string
  @Field()
  @Column({comment:"发布时间间隔限制，0表示不限制"})
  limitTimes:string
  @Field()
  @Column({comment:"相似度值限制，0表示不限制"})
  limitSimilar:string


  @Field()
  @Column({comment:"1启用库存，0禁用库存"})
  isStock:string
  @Field()
  @Column({comment:"产品全球价格设置"})
  worldLocation:string

}