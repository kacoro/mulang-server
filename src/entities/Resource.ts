
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, PrimaryGeneratedColumn  } from "typeorm";


@ObjectType()
@Entity()
export class Resource extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number;

  @Field()
  @Column({nullable:true})
  title: string;

  @Field()
  @Column({nullable:true})
  type: string;

  @Field()
  @Column({nullable:true})
  mimetype: string;

  @Field()
  @Column({nullable:true})
  filename: string;

  @Field()
  @Column({nullable:true})
  ext: string;

  @Field()
  @Column()
  url!: string;

  @Field()
  @Column({type:"int",default:0})
  status!: number;

  @Field()
  @Column({nullable:true,type:"longtext"})
  note: string;

  @Field()
  @Column()
  creatorId:number;

}