import { HelloResolver } from "./hello";
import { PostResolver } from "./post";
import { UserResolver } from "./user";
import {CateResolver} from './category'
import {ModuleResolver} from './module';
import { UploadResolver } from "./upload";
import { FieldResolver } from "./field";
import { ProjectResolver } from "./project";
export const resolvers = [
    HelloResolver, 
    FieldResolver,
    PostResolver,
    UserResolver,
    UploadResolver,
    CateResolver,
    ModuleResolver,
    ProjectResolver
]  as const

   