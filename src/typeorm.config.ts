import {  ConnectionOptions } from "typeorm";
import { __prod__ } from "./constants";

import path from 'path'
// import { Updoot } from "./entities/Updoot";
export default {
    type: 'mysql',
    // database: 'multilangsite',
    // username: 'multisite',
    // password: '123456',
    // entities:[Post, User,Updoot],
    url:process.env.DATABASE_URL,
    logging: false,
    synchronize: true,
    entities: [ path.join(__dirname,'./entities/**{.ts,.js}') ],
    migrations:[path.join(__dirname,"./migrations/*")],
    charset:"utf8mb4",
    autoSchemaSync: true
    // debug:true,
    // log:true
} as  ConnectionOptions ;