
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column,  CreateDateColumn,  Entity,  PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

@ObjectType()
@Entity()
export class Site extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn( {comment:'自增ID，也是应用ID'})
  id!: number;

  @Field()
  @Column({comment:"标识",unique:true}) 
  identifier:string

  @Field()
  @Column( {comment:'网站名称'})  
  title!: string;

  @Field()
  @Column({comment:"默认站点",default:false}) 
  isDefault:boolean

  @Field()
  @Column( {comment:'备注信息',default:""})  
  note: string;

  @Field()
  @Column({comment:"排序",default:0}) 
  sort:number

  @Field()
  @Column({comment:"网站状态",default:true}) 
  status:boolean

  @Field()
  @Column({comment:"关闭原因",default:""}) 
  closeReason:string

  @Field()
  @Column({comment:"网站logo",default:""}) 
  logo:string

  @Field()
  @Column({comment:"网站图标",default:""}) 
  shortcut:string
  
  @Field()
  @Column({comment:"SEO标题",default:""})
  seoTitle:string
  
  @Field()
  @Column({comment:"SEO关键字",default:""})
  seoKeywords:string

  @Field()
  @Column({comment:"SEO描述",default:""})
  seoDesc :string
  
  @Field(()=>String,{nullable:true})
  @Column({type:"longtext",nullable:true})
  copyright: string;

  @Field(()=> String,{nullable:true})
  @CreateDateColumn({type:'timestamp',length:''})
  createdAt = new Date();

  @Field(()=> String,{nullable:true})
  @UpdateDateColumn({type:'timestamp',length:''})
  updatedAt = new Date();

}