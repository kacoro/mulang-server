
import jwt from 'jsonwebtoken';
import {redis} from '../index';
/*
需要考虑用户从不同的客户的客户端登录/退出，对toekn进行验证和操作
也可以加入ip地址。根据不同的ip地址进行判定
利用黑名单或者撤销名单，需要考虑持久化，暂时使用redis

// 验证 token
const decoded = verifyToken(token, secret);
// 解码 token
const decoded = decodeToken(token);

//定义payload，通常包含用户信息
const payload = {
  sub: 'user123', // subject，通常是用户ID
  name: 'John Doe',
  role: 'admin',
  iat: Math.floor(Date.now() / 1000), // 签发时间（Unix时间戳）
};

*/


// 定义一个用于生成 JWT 的函数


export const generateToken = (payload: any, secret: string= process.env.JWT_SECRET || ""): string => {
    return jwt.sign(payload, secret, {
      expiresIn: process.env.JWT_EXPIRESIN, // 设置 token 的过期时间为 1 小时,eg: 60, "2 days", "10h", "7d"  ("120" is equal to "120ms")
    });
  };

// 定义一个用于验证 JWT 的函数
export const verifyJwt = (token: string, secret: string = process.env.JWT_SECRET || ""): any => {
  // console.log(token)
    try {
      const payload  = jwt.verify(token, secret);
      return payload ;
    } catch (error) {
      if (error.name === 'TokenExpiredError') {
        // token 已过期
        throw new Error('Token expired');
      } else if (error.name === 'JsonWebTokenError') {
        // 无效的 token
        throw new Error('Invalid token');
      }
      throw error;
    }
  };

// 定义一个用于解码 JWT 的函数
export const decodeToken = (token: string): any => {
    return jwt.decode(token, { complete: true });
  };

  // 假设这个函数用于将 token 添加到黑名单
  export const addTokenToBlacklist = (token: string) => {//谨慎操作
    redis.set(token, "true");
};
// 假设这个函数用于从黑名单中删除 token
export const removeTokenFromBlacklist = (token: any) => {
    redis.del(token);
};

// 续签
// const refreshToken = (req, res) => {
//   const token = req.headers.authorization.split(' ')[1]; // 从 Authorization 头中提取 token
//   if (!token) {
//     return res.status(401).send('Access denied. No token provided.');
//   }
//   try {
//     const payload = jwt.verify(token, process.env.JWT_SECRET ||""); // 验证 token
//     const newToken = jwt.sign(payload, process.env.JWT_SECRET ||"", { expiresIn:  process.env.JWT_EXPIRESIN }); // 生成新的 token
//     res.json({ token: newToken }); // 返回新的 token
//   } catch (err) {
//     res.status(400).send('Invalid token.');
//   }
// };
