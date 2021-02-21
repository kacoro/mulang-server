
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, CreateDateColumn, Entity, ManyToOne, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Module } from "./Module";

@ObjectType()
@Entity()
export class Project extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number;

  @Field(() => Int,{nullable:true})
  voteStatus:number | null; // 1 or -1 or null

  @Field()
  @Column()
  title!: string;

  @Field()
  @Column({type:"longtext"})
  note!: string; //模块说明

  @Field()
  @Column()
  moduleId:number;

  @ManyToOne(() => Module,(module) =>module.projects)
  module:Module

  @Field(()=> String)
  @CreateDateColumn({type:'timestamp',length:''})
  createdAt = new Date();

  @Field(()=> String)
  @UpdateDateColumn({type:'timestamp',length:''})
  updatedAt = new Date();
 
}