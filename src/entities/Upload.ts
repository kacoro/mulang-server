

import { Field,  ObjectType } from "type-graphql";


@ObjectType()
export class Upload  {
  @Field()
  filename!: string;

  @Field()
  mimetype!: string;

  @Field()
  encoding!: number;


}