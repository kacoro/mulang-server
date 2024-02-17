import { User } from '../entities/User'
import { MyContext } from '../types'
import { MiddlewareFn } from 'type-graphql'

export const isAuth: MiddlewareFn<MyContext> = async ({ context }, next) => {
    // console.log(context.req.session.userId)
    // if (!context.req.session.userId) {
    //     console.log('not authenticated', context.req.session.userId)
    //     throw new Error('not authenticated')
    // }
    //  const user = await User.findOneBy({ id: context.req.session.userId });
    //  if (!user) {
    //      throw new Error('not authenticated')
    //  }
    // return next();
    let payload = context.payload
    // console.log(payload)
    if (!payload) {
        console.log('not authenticated', context.payload)
        throw new Error('not authenticated')
    }
     const user = await User.findOneBy({ id: payload.sub });
     if (!user) {
         throw new Error('not authenticated')
     }
    return next();
}