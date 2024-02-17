import {Request,Response} from 'express'
import {Redis} from 'ioredis';
// import { createUpdootLoader } from './utils/DataLoader/createUpdootLoader';
// import { createUserLoader } from './utils/DataLoader/createUserLoader';
// import { createFieldLoader } from './utils/DataLoader/createFieldLoader';
// import { createModuleLoader } from './utils/DataLoader/createModuleLoader';
import loaders from './utils/entitieLoaders'
export type MyContext = {
    payload: any;
    req: Request & { session: {
        userId?:number
        headers?:any &{
            authorization:string
        }
    } }
    res: Response,
    redis:Redis;
    // loaders: {
    //     UserLoader:ReturnType<typeof createUserLoader>,
    //     UpdootLoader:ReturnType<typeof createUpdootLoader>,
    //     ModuleLoader:ReturnType<typeof createModuleLoader>,
    //     FieldLoader:ReturnType<typeof createFieldLoader>
    // }
    loaders:typeof loaders,
    token: string;
}

