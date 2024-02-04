

declare module 'fs-capacitor';

declare module "processRequest";

import { ReadStream } from "fs";
import { IncomingMessage, ServerResponse } from "http";
import { GraphQLScalarType } from "graphql";
import { RequestHandler } from "express";
export class ReadAfterDestroyedError extends Error {}



export interface UploadOptions {
  maxFieldSize?: number;
  maxFileSize?: number;
  maxFiles?: number;
}

export interface GraphQLOperation {
  query: string;
  operationName?: null | string;
  variables?: null | unknown;
}

export function processRequest(
  request: IncomingMessage,
  response: ServerResponse,
  uploadOptions?: UploadOptions
): Promise<GraphQLOperation | GraphQLOperation[]>;

export function graphqlUploadExpress(
  uploadOptions?: UploadOptions
): RequestHandler;


export const GraphQLUpload: GraphQLScalarType;

export interface FileUpload {
  filename: string;
  mimetype: string;
  encoding: string;
  createReadStream(): ReadStream;
}
