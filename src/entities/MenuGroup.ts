
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Menu } from './Menu'

@ObjectType()
@Entity()
export class MenuGroup extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn({ comment: "自增ID号" })
  id!: number;

  @Field()
  @Column({ comment: "名称，用于后台管理" })
  title!: string;

  @Field()
  @Column({ comment: "标识" ,unique:true})
  identifier!: string;

  @OneToMany(() => Menu, menu => menu.group)
  menus: Menu[]

}