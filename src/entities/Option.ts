
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";

import { OptionGroup } from "./OptionGroup";

@ObjectType()
@Entity()
export class Option extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn({ comment: '自增ID，也是应用ID' })
  id!: number;

  @Field()
  @Column({ comment: '名称' })
  title!: string;

  @Field()
  @Column({ comment: '值' })
  value!: string;

  @Field(() => Int)
  @Column({ comment: "组id",type:"int"})
  groupId!: number

  @Field(() => Int)
  @Column({ comment: "父id",type:"int",default:0})
  parentId: number

  @Field()
  @Column({ comment: '排序，值越小越往前靠', type: "int", default: 255 })
  sort: number;

  @Field(() => OptionGroup,{nullable:true})
  @ManyToOne(() => OptionGroup, (optionGroup) => optionGroup.options, { cascade: true,onDelete:"CASCADE" })
  group: OptionGroup

  // createForeignKeyConstraints: false
  @ManyToOne(() => Option, option => option.children,{ createForeignKeyConstraints: false,onDelete:"CASCADE",onUpdate:"CASCADE"})  
  parent: Option;

  @Field(() => [Option],{nullable:true})
  @OneToMany(() => Option, option => option.parent,{nullable:true})
  children: Option[];

 
  //   @Field(()=>OptionGroup)
  //   @ManyToOne(() => OptionGroup,(module) =>module.projects,{onDelete:'CASCADE'})
  //   module:OptionGroup


}