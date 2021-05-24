
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, CreateDateColumn, Entity, ManyToOne,  PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

import { User } from "./User";

@ObjectType()
@Entity()
export class News extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number;

  parentId: number;

  cateId: number;

  moduleId:number;

  projectId:number;

  @Field(() => Int,{nullable:true})
  voteStatus:number | null; // 1 or -1 or null

  @Field()
  @Column()
  title!: string;

  @Field()
  @Column({type:"longtext"})
  text!: string;

  @Field()
  @Column({type:"int",default:0})
  hits!: number;

  @Field()
  @Column()
  creatorId:number;

  @Field()
  @ManyToOne(() => User,user =>user.posts)
  creator:User

  @Field(()=> String)
  @CreateDateColumn({type:'timestamp',length:''})
  createdAt = new Date();

  @Field(()=> String)
  @UpdateDateColumn({type:'timestamp',length:''})
  updatedAt = new Date();
 
}