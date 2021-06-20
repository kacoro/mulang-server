
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, ManyToOne, PrimaryGeneratedColumn  } from "typeorm";
import { ResourceGrooup } from "./ResourceGrooup";

@ObjectType()
@Entity()
export class Resource extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number;

  @Field(() => Int)
  @Column({ comment: "组id",type:"int",default:0})
  groupId!: number

  @Field(() => ResourceGrooup,{nullable:true})
  @ManyToOne(() => ResourceGrooup, (group) => group.resources, { createForeignKeyConstraints: false,cascade: true,onDelete:"CASCADE" })
  group: ResourceGrooup

  @Field()
  @Column({nullable:true, comment: "内容"})
  title: string;

  @Field()
  @Column({nullable:true, comment: "存储目录"})
  folder: string;

  @Field()
  @Column({nullable:true, comment: "资源文件名"})
  name: string;

  @Field()
  @Column({nullable:true})
  type: string;

  @Field()
  @Column({nullable:true, comment: "附件类型"})
  mimetype: string;

  @Field()
  @Column({nullable:true, comment: "文件名带路径"})
  filename: string;

  @Field()
  @Column({nullable:true, comment: "资源后缀，如jpg等"})
  ext: string;

  @Field()
  @Column({nullable:true, comment: "ICO图标文件"})
  ico: string;
  
  @Field()
  @Column()
  url!: string;

  @Field()
  @Column({type:"int",default:0})
  status!: number;

  @Field()
  @Column({nullable:true,type:"longtext"})
  note: string;

  @Field()
  @Column({nullable:true,comment:"附件属性"})
  attr: string;
  
  @Field(()=>Int)
  @Column({nullable:true,type:"int",comment:"附件属性"})
  download: number;
  

  @Field()
  @Column()
  creatorId:number;

}