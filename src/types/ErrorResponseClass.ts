import { ClassType, Field, Int, ObjectType } from "type-graphql";

export default function ErrorResponse<TItem extends object>(TItemClass: ClassType<TItem>) {
  // @ObjectType({ isAbstract: true })   //isAbstract: true 为防止在架构中注册：
  @ObjectType() 
  abstract class ErrorResponseClass {
    @Field(() => [TItemClass])
    // and here the generic type
    items: TItem[];

    @Field(() => Int)
    page: number

    @Field(() => Int)
    limit: number

    @Field()
    hasMore: boolean;

    @Field()
    total: number

    @Field()
    totalPage: number
  }
  return ErrorResponseClass;
}