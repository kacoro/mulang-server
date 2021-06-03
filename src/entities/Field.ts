
import { Field as GField, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { User } from "./User";
@ObjectType()
@Entity()
export class Field extends BaseEntity {
    @GField(() => Int)
    @PrimaryGeneratedColumn({comment:"字段id自增"})
    id!: number;

    @GField({nullable: true})
    @Column({comment: '模型id，数字为模型id，非数字表示其他模型id ，空表示常用字段',nullable: true,default:""})
    moduleId: string; 

    @GField()
    @Column({comment:'字段标识符',default:""})
    identifier: string

    @GField()
    @Column({comment:'字段名称',default:""})
    title!: string;

    @GField({nullable: true})
    @Column({ type: "longtext" ,comment:'备注',nullable: true})
    note: string ; //备注

    @GField()
    @Column({comment:'字段类型',default:""})
    type: string;
    /*
    字段类型
    varchar 字符串（长度是255个字符，最多只能放80个汉字）  
    int 整型（11位整数，最大值为2147483647，最小值为-2147483648） 
    float 浮点型（支持负号，主要适用于有小数点的数据）
    date 日期（数据库保存格式是：YYYY-MM-DD，请注意，这个不是时间戳）
    datetime 日期时间（存储格式是：YYYY-MM-DD HH:ii:ss）
    longtext 长文本（适用于存储文章内容及其他长文）
    longblob 二进制信息（适用于存储二进制数据，不清楚请不要选这一项）
   */
    @GField()
    @Column({comment:'表单类型',default:"text"})
    formType: string;

    
    /*
        表单类型
        text 文本框（不支持回车符号，不超过255个字符或80个汉字的时候建议选择）
        password 密码框（文本框变种，保留首页和末位字符显示，中间用星号表示）
        radio 单选框（适合使用于数据量小，比较固定的选项，如性别，是否等）
        checkbox 复选框（适用于数据量小，但要有多种选择，如兴趣爱好等）
        select 下拉菜单（与单选框类似，适用于数据量小使用）
        textarea 文本区（支持回车符号，注意容易与HTML代码冲突，建议实体文本使用）
        editor 编辑器（支持HTML编写，提交数据时建议选择：安全HTML）
        code_editor 代码编辑器（手写代码，适用于放置统计代码，分享代码等，提交时建议选择：完整HTML）
        upload 附件（请注意，仔细配置好上传的附件类型等信息）
        title 主题（支持绑定多个项目，输出的内容未格式化，需要自行格式化）
        extitle 扩展模型（仅能单选一个项目，项目要求绑定模块）
        user 会员（支持单选和多选，仅限后台使用） 
        url 网址（字段类型一定要选择长文本，否则可能会被截断出错）
        param 规格参数（字段类型请选择长文本，否则数据会被截断出错）
        pca 省市县联动（仅限国内使用，同时也用于物流应用）
    */

    @GField()
    @Column({comment:'表单扩展内容',default:""})
    formExt: string;

    @GField()
    @Column({comment:'接收数据格式化',default:"safe"})
    format: string;
    /* 
        接收数据格式化：设置文本常见格式，如HTML，整型，浮点型等
         safe 实体文本（HTML实体化，包括单双引号，尖括号都会实体化显示）
         普通文本（HTML代码都会被清除掉，即所有尖括号内容都会被清除）
    */

    @GField()
    @Column({comment:'默认值',default:""})
    content: string; //默认值

    @GField()
    @Column({comment:'排序',default:0})
    sort: number; //值越小越往前靠，可选范围：1-255

    @GField()
    @Column({ type:"boolean", default: false,comment:'唯一性 0 禁用 1使用' })
    onlyone: boolean; 

    @GField()
    @Column({ type:"boolean", default: false ,comment:'默认值'})
    isFront: boolean; //前端处理： 设置前端是否可用，如果需要前端加载相应属性请在这里操作 0 禁用 1使用

    @GField()
    @Column({ type: "int", default: 0 ,comment:'是否可以搜索  0不支持搜索 1完全匹配搜索 2 部分匹配搜索  3区间搜索 '})
    search: number; 

    @GField()
    @Column({comment:'区间搜索时使用的分隔符',default:""})
    searchSeparaStor: string//区间搜索时使用的分隔符

//   ext_form_id: form_btn,ext_format,ext_quick_words,ext_quick_type,ext_include_3,ext_field,ext_onlyone
//     form_btn: ext_field: 
//     ext_quick_words: 
//     ext_quick_type: 
//     ext_include_3: 0
//     form_style: 
//     content: 
  

    @ManyToOne(() => User, user => user.posts)
    creator: User
   
}