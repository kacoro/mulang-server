
import { Field, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column,  Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn} from "typeorm";
import { MenuGroup } from "./MenuGroup";
@ObjectType()
@Entity()
export class Menu extends BaseEntity {
  @Field(() => Int)
  @PrimaryGeneratedColumn()
  id!: number;

  @Field(() => Int)
  @Column({default:0})
  siteId:number

  @Field(() => Int)
  @Column({ comment: "组id",type:"int"})
  groupId!: number

  @Field(() => MenuGroup,{nullable:true})
  @ManyToOne(() => MenuGroup, (group) => group.menus, { cascade: true,onDelete:"CASCADE" })
  group: MenuGroup

  @Field(() => Int)
  @Column({comment:"父级id",default:0})
  parentId:number

  // createForeignKeyConstraints: false
  @ManyToOne(() => Menu, option => option.children,{ createForeignKeyConstraints: false,onDelete:"CASCADE",onUpdate:"CASCADE"})  
  parent: Menu;

  @Field(() => [Menu],{nullable:true})
  @OneToMany(() => Menu, option => option.parent,{nullable:true})
  children: Menu[];

  @Field(() => String)
  @Column({comment:"标题",default:0})
  title:string; // 1 or -1 or null

  @Field()
  @Column({comment:"类型，project指项目，cate指分类，content指内容，link自定义"})
  type!: string;

  @Field()
  @Column({type:"int",comment:"项目ID"})
  projectId: number;

  @Field()
  @Column({type:"int",default:0,comment:"分类id"})
  categoryId: number;

  @Field()
  @Column({type:"int",default:0,comment:"主题id"})
  listId: number;

  @Field()
  @Column({default:0,comment:"自定义链接，最长不能超过255"})
  link: string    

  @Field()
  @Column({type:"int",default:0,comment:"0当前页，1新窗口"})
  target:number;

  @Field()
  @Column({type:"int",default:0,comment:"排序，最大255，值越小越往前靠"})
  sort: number;

  @Field()
  @Column({type:"int",default:0,comment:"访问权限类型:0游客，1仅限会员"})
  accessType: number;  

  @Field()
  @Column({type:"int",default:1,comment:"0未审，1正常"})
  status: number;    

  @Field( ()=>String)
  @Column({comment:"下级菜单类型"}) 
  submenu : string
 
}