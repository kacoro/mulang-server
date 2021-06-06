
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Option } from './Option'

@ObjectType()
@Entity()
export class OptionGroup extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn({ comment: "自增ID号" })
  id!: number;

  @Field()
  @Column({ comment: "名称，用于后台管理" })
  title!: string;

  @Field()
  @Column({ comment: "连接字符，未设置使用英文竖线" ,default:""})
  linkSymbol: string;

  @OneToMany(() => Option, option => option.group)
  options: Option[]

}