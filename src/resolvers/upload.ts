
import { Resolver, Arg, Mutation, Ctx, UseMiddleware, Field, ObjectType } from "type-graphql";
import { MyContext } from "../types";
import { isAuth } from "../middleware/isAuth";
import fs from 'fs'
import path from 'path'
import { GraphQLUpload, FileUpload } from 'graphql-upload'
// import { GraphQLError } from "graphql";

function generateRandomString(length: number) {
    var result = ''
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    var charactersLength = characters.length
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength))
    }
    return result;
}

@ObjectType()
class uploadError {
    @Field()
    message?: string;

}

@ObjectType()
class FileResponse {
    @Field(() => String, { nullable: true })
    url?: string | null
    @Field(() => uploadError, { nullable: true })
    error?: uploadError | null
}




@Resolver()
export class UploadResolver {

    @Mutation(() => FileResponse)
    @UseMiddleware(isAuth)
    async uploadFile(
        @Arg("file", () => GraphQLUpload) file: FileUpload,
        @Ctx() { }: MyContext
    ): Promise<FileResponse> {


        try {
            const { createReadStream, filename } = await file; //createReadStream,filename,mimetype,encoding
            
            const { ext } = path.parse(filename)
            const randomName = generateRandomString(12) + ext
           
            const pathName = path.join(__dirname, `../../public/upload/images/${randomName}`)
            const stream = createReadStream()
            const check = () => {
                return new Promise((resolve,reject) => {
                    const writeStream = fs.createWriteStream(pathName)
                    writeStream.on('finish', resolve);
                    writeStream.on('error', (error) => {
                        fs.unlink(pathName, () => {
                          reject(error);
                        });
                      });
                      stream.on('error', (error) => writeStream.destroy(error));
                      stream.pipe(writeStream);
                })
            }
            const error = await check()
            console.log("error",error)
            if (error) {
                return {
                    error: {
                        message: "上传失败."
                    }
                };
            } else{
                return {
                    url: '/upload/images/' + randomName,

                };
            }

        } catch (error) {
            console.log("catch error:")
             if(error.message && error.message.indexOf('size limit')){
                 return {
                    error:{
                        message:"不能超过10M"
                    }
                 }
             }
            // throw new GraphQLError("失败");
            //throw new GraphQLError(error.message);
            return {
                error:{
                    message:"上传失败!"
                }
            };
        }

    }
}