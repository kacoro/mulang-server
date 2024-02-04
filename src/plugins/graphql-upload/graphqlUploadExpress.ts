
import {NextFunction, Request,Response } from "express";
import {processRequest as defaultProcessRequest, } from "./processRequest";

 export interface UploadOptions {
  maxFieldSize?: number;
  maxFileSize?: number;
  maxFiles?: number;
}

// interface GraphqlUploadExpress{ (
//   processRequest:GraphQLOperation | GraphQLOperation[] ,
//     uploadOptions?: UploadOptions,
//   ): void
// }

export const  graphqlUploadExpress = ( {processRequest = defaultProcessRequest,
  ...processRequestOptions})=>{
    
    function graphqlUploadExpressMiddleware(request: Request, response: Response, next: NextFunction) {
      if (!request.is("multipart/form-data")) return next();
    
      const requestEnd = new Promise((resolve) => request.on("end", resolve));
      const { send } = response;
      response.send = function (...args) {
        requestEnd.then(() => {
          response.send = send;
          response.send(...args);
        });
        return this;
      };

      processRequest(request, response, processRequestOptions)
      .then((body: any) => {
        console.log(body)
        request.body = body;
        next();
      })
      .catch((error: { status: number; expose: any; }) => {
        if (error.status && error.expose) response.status(error.status);
        next(error);
      });

    }

    return graphqlUploadExpressMiddleware;
}
  