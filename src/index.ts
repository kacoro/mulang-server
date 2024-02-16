import "reflect-metadata";
import 'dotenv-safe/config';
import { COOKIE_NAME, __prod__ } from "./constants";
console.log(COOKIE_NAME)
import express from 'express';
// import { ApolloServer } from 'apollo-server-express';
import { ApolloServer } from '@apollo/server';
// import { startStandaloneServer } from '@apollo/server/standalone';
import { expressMiddleware } from '@apollo/server/express4';

import { ApolloServerPluginDrainHttpServer } from '@apollo/server/plugin/drainHttpServer';
import http from 'http';
import { buildSchema } from 'type-graphql';

import Redis from 'ioredis';
import session from 'express-session';
import connectRedis from 'connect-redis'
// import { MyContext } from "./types";
import cors from 'cors';
import { DataSource  } from 'typeorm';
import entitieLoaders from './utils/entitieLoaders';
import typeormConfig from "./typeorm.config";
import {resolvers} from './resolvers'

// @ts-ignore
// import graphqlUploadExpress from "grpahql-upload/graphqlUploadExpress.mjs";

import { graphqlUploadExpress } from './plugins/graphql-upload'
export const AppDataSource = new DataSource (typeormConfig)
export const Manager = AppDataSource.manager
const main = async () => {
   
    await AppDataSource.initialize()
    // const conn = await createConnection(typeormConfig)
    // await conn.runMigrations();
    const app = express();
    const httpServer = http.createServer(app);
    const RedisStroe = connectRedis(session)
    console.log(process.env.REDIS_URL||9978)
    const redis = new Redis({port:Number(process.env.REDIS_PORT)})
    
    app.set('trust proxy',1);
    app.use(cors({
        origin: process.env.CORS_ORIGIN?.split(","),
        credentials: true
    }))
    // app.use(cors())
    app.use(
        session({
            name: COOKIE_NAME,
            store: new RedisStroe({ client: redis  as any, disableTouch: true, disableTTL: true }),
            secret: process.env.SESSION_SECRET || 'asdasd',
            cookie: {
                maxAge: 1000 * 60 * 60 * 24 * 10,
                httpOnly: true,
                sameSite: 'lax',//csrf
                secure: __prod__, //true works in https
                domain:__prod__?'.kacoro.com':undefined
            },
            saveUninitialized: false,
            resave: false,
           
        })
    )

    app.get('/', (_, res) => {
        res.send('hello')
    })
    app.use(express.static('public'));
    app.use(graphqlUploadExpress({ maxFileSize: 20*1024*1024,maxFieldSize: 10*1024*1024, maxFiles: 10 }));
    
    const schema = await buildSchema({
        resolvers:resolvers ,
        validate: false
    })

    const apolloServer = new ApolloServer({ schema ,plugins: [ApolloServerPluginDrainHttpServer({ httpServer })]});
    //     const { url } = await startStandaloneServer(server, {
    //     context: async ({ req,res }) => ({  req, res , redis,loaders:entitieLoaders}),
        
    //  });
    await apolloServer.start();
    app.use(
        '/graphql',
        cors<cors.CorsRequest>(),
        express.json(),
        expressMiddleware(apolloServer, {
          context: async ({ req ,res}) => ({ req, res, redis,loaders:entitieLoaders,token: req.headers.token }),
        }),
      );
      
    // const apolloServer = new ApolloServer({
    //     schema: await buildSchema({
    //         resolvers:resolvers ,
    //         validate: false
    //     }),
    //     context: ({ req, res }): MyContext => ({ req, res, redis,loaders:entitieLoaders }),
       
    //     formatError: (err) => {
    //         // Don't give the specific errors to the client.
    //         console.log("err",err)
    //         if (err.message.startsWith("fileError")) {
    //           return new Error('PayloadTooLargeError');
    //         }
    //         // Otherwise return the original error.  The error can also
    //         // be manipulated in other ways, so long as it's returned.
    //         return err;
    //     },
    //      uploads:false,
    //     // uploads: {
    //     //     maxFileSize: 10000000, // 10 MB
    //     //     maxFiles: 10,
    //     // },
    // })
   
    process.on('uncaughtException', function (err) {
        //打印出错误
        console.log(err);
        //打印出错误的调用栈方便调试
        // console.log(err.stack)
      });
      process.on('unhandledRejection', (err) => {
        console.log('这里有个未处理的异步错误', err)
    
    })
   
    const errorHandler = (err:Error, res: any)=> {
        console.error(err);
        res.status(500).send('Something broke!');
    }
     app.use(errorHandler);
    // apolloServer.applyMiddleware({
    //     app,
    //     bodyParserConfig: {
    //         limit: "10mb"
    //         },
    //     cors: false
    // });

    // app.listen(process.env.PORT, () => {
    //     console.log('server started on localhost:'+process.env.PORT)
    // })

    await new Promise<void>((resolve) => httpServer.listen({ port: process.env.PORT }, ()=>{
        console.log('server started on localhost:'+process.env.PORT)
        resolve
    }));
}

main().catch((err) => {
    console.log("main err :",err);
})

