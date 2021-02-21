
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, CreateDateColumn, Entity, OneToMany, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import {Project} from './Project'

@ObjectType()
@Entity()
export class Module extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number;

  @Field()
  @Column()
  title!: string;

  @Field()
  @Column({type:"longtext"})
  text!: string;

  @Field(()=> String)
  fiedls:string;

  @OneToMany(() =>Project,project =>project.module)
  projects:Project[]

  @Field(()=> String)
  @CreateDateColumn({type:'timestamp',length:''})
  createdAt = new Date();

  @Field(()=> String)
  @UpdateDateColumn({type:'timestamp',length:''})
  updatedAt = new Date();
 
}