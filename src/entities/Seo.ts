import { Field,  ObjectType } from "type-graphql";

@ObjectType()

export class Seo {

    @Field( ()=>String,{nullable:true})
    title: string;

    @Field(()=>String,{nullable:true})
    keywords: string;

    @Field(()=>String,{nullable:true})
    description: string;

}
