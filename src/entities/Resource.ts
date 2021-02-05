
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, PrimaryGeneratedColumn  } from "typeorm";


@ObjectType()
@Entity()
export class Resource extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number;

  @Field()
  @Column()
  title!: string;

  @Field()
  @Column()
  type!: string;

  @Field()
  @Column({type:"int",default:0})
  status!: number;

  @Field()
  @Column({type:"longtext"})
  note!: string;

  @Field()
  @Column()
  creatorId:number;

}