
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, CreateDateColumn, Entity, OneToMany, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import {Project} from './Project'

@ObjectType()
@Entity()
export class Module extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn({comment:"自增ID号"})
  id!: number;

  @Field()
  @Column({comment:"模块名称"})
  title!: string;

  @Field()
  @Column({comment:"模块说明"})
  note: string;

  @Field()
  @Column({comment:"模块排序",default:0})
  sort: number;

  @Field()
  @Column({comment:"0不使用1使用",default:0})
  status:number

  @Field(()=> String)
  @Column({comment:"后台字段布局",default:"hits,createdAt,sort"})
  layout:string;

  @Field()
  @Column({comment:"类型 0联合模块，1独立模块",default:0})
  type: number;

  @Field()
  @Column({comment:"关联主表",default:"list"}) //请选择集成环境对应的主表，目前官网仅对分类及主题进行横向扩展
  table: string;

  
  @OneToMany(() =>Project,project =>project.module)
  projects:Project[]

  @Field(()=> String)
  @CreateDateColumn({type:'timestamp',length:''})
  createdAt = new Date();

  @Field(()=> String)
  @UpdateDateColumn({type:'timestamp',length:''})
  updatedAt = new Date();
 
}