import { HelloResolver } from "./hello";
import { PostResolver } from "./post";
import { UserResolver } from "./user";
import {CateResolver} from './category'
import {ModuleResolver} from './module';
import { UploadResolver } from "./upload";
import { FieldResolver } from "./field";
import { ProjectResolver } from "./project";
import { ListResolver } from "./list";
import { SiteResolver } from "./site";
import { OptionResolver } from "./option";
import { OptionGroupResolver } from "./optionGroup";
import { MenuResolver } from "./menu";
import { MenuGroupResolver } from "./menuGroup";
export const resolvers = [
    HelloResolver, 
    FieldResolver,
    PostResolver,
    UserResolver,
    UploadResolver,
    CateResolver,
    ModuleResolver,
    ProjectResolver,
    ListResolver,
    SiteResolver,
    OptionResolver,
    OptionGroupResolver,
    MenuResolver,
    MenuGroupResolver
]  as const

   