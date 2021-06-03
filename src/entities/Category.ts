
import { Field, Int, ObjectType } from "type-graphql";
import {  BaseEntity, Column, Entity, PrimaryGeneratedColumn, Tree, TreeChildren, TreeParent } from "typeorm";

// m to n
// many to many
// user <-> post
// user ->join table <- posts
// user -> updoot <- post

@Entity()
@Tree('materialized-path')
@ObjectType()
export class Category extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number

  @Field()
  @Column()
  name: string;

  @Field()
  @Column({unique:true})
  identity!: string;

  @Field(()=> [Category],{nullable:true})
  @TreeChildren()
  children: Category[];

  @Field(()=> Category,{nullable:true})
  @TreeParent()
  parent: Category;

  @Field()
  @Column({default:0})
  status: number;

  @Field()
  @Column({comment:"SEO标题",default:""})
  seoTitle:string
  
  @Field()
  @Column({comment:"SEO关键字",default:""})
  seoKeywords:string
  
  @Field()
  @Column({comment:"SEO描述",default:""})
  seoDesc :string
    

}