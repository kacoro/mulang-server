
import { Field, Int, ObjectType } from "type-graphql";
 import GraphQLJSON from 'graphql-type-json'
// import { GraphQLJSONObject } from 'graphql-type-json'


@ObjectType()

export class List  {
  
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title:string;

  @Field(() => Int)
  projectId:number;

  @Field(() => Int,{nullable:true})
  categoryId: number;

  @Field(()=> String,{nullable:true})
  createdAt =  new Date();

  @Field(()=> String,{nullable:true})
  updatedAt =  new Date();

  @Field(()=> String,{nullable:true})
  createTime:string;

  @Field(()=> String,{nullable:true})
  updateTime:string;


  @Field(()=> String,{nullable:true})
  note : string;

  @Field(()=> String,{nullable:true})
  thumb :string;

  @Field(()=> String,{nullable:true})
  banner :string;

  //把其余的字段放到other，以后处理。
  @Field(() => GraphQLJSON,{nullable:true}) 
  other:JSON

}