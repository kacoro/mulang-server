
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity } from "typeorm";

@ObjectType()
export class List extends BaseEntity {
  @Field(() => Int)
  id!: number;

  parentId: number;

  cateId: number;

  moduleId:number;

  projectId:number;

  @Field(() => Int,{nullable:true})
  voteStatus:number | null; // 1 or -1 or null

  @Field()
  title!: string;

}