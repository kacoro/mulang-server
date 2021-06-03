import {Request,Response} from 'express'
import {Redis} from 'ioredis';
import { createUpdootLoader } from './utils/createUpdootLoader';
import { createUserLoader } from './utils/createUserLoader';
import { createFieldLoader } from './utils/createFieldLoader';
import { createModuleLoader } from './utils/createModuleLoader';
export type MyContext = {
   
    req: Request & { session: {
        userId?:number
    } }
    res: Response,
    redis:Redis;
    loaders: {
        UserLoader:ReturnType<typeof createUserLoader>,
        UpdootLoader:ReturnType<typeof createUpdootLoader>,
        ModuleLoader:ReturnType<typeof createModuleLoader>,
        FieldLoader:ReturnType<typeof createFieldLoader>
    }
}