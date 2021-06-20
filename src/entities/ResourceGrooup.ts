

import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Resource } from './Resource'

@ObjectType()
@Entity()
export class ResourceGrooup extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn({ comment: "自增ID号" })
  id!: number;

  @Field()
  @Column({ comment: "名称，用于后台管理" })
  title!: string;

  @Field()
  @Column({ comment: "存储目录" })
  root:string

  @Field()
  @Column({ comment: "存储目录格式" })
  folder:string 

  @Field(()=>Boolean)
  @Column({ comment: "默认" ,default:false})
  isDefault:boolean 

  @Field()
  @Column({ comment: "附件类型" })
  filetypes:string 

  @Field()
  @Column({ comment: "类型说明" })
  typeinfo:string 

  @Field()
  @Column({ comment: "支持的GD方案，多个GD方案用英文ID分开" })
  gdtypes:string 

  @Field()
  @Column({ comment: "1支持全部GD方案0仅支持指定的GD方案" })
  gdall:string
  
  @Field()
  @Column({ comment: "后台缩略图" })
  ico:string

  @Field()
  @Column({ comment: "上传文件大小限制" })
  filemax:string

  @Field()
  @Column({ comment: "0本地存储，其他数据则调用不同的网关存储" })
  etype:string
  
  @Field()
  @Column({ comment: "0传统上传，1二进制上传" })
  upload_binary:string

  @Field()
  @Column({ comment: "0不压缩，大于0的数值表示宽高超过时就压缩到这个值内" })
  compress:string
  

  @OneToMany(() => Resource, resource => resource.group)
  resources: Resource[]

}