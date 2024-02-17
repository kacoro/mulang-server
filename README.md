# server demox

this demo dependencies:
>express
>typeorm 
>apollo-server
>graphql
>redis
>mysql


## How to use

```bash
#install
yarn install

#create migration
create:migration

#dev
yarn dev

yarn build

yarn start
```

## How to deploy by docker-compose

```
docker-compose up -d --build
```

or without api env
```
docker-compose -f docker-compose-env.yml up -d
```

stop
```
docker-compose -f docker-compose-env.yml stop
```

stop and delete
```
docker-compose -f docker-compose-env.yml down
```

```
pm2 start npm --name server -- start
```

##  GraphQL Playground debug

在请求头header 添加Authorization: Bearer <token>


## jwt
const client = new ApolloClient({
  uri: 'http://localhost:4000',
  headers: {
    authorization: `Bearer ${localStorage.getItem('token')}`,
  },
});

## changeLog

1、update typeorm
> see more detailshttps://orkhan.gitbook.io/typeorm/

skip lib check

```
"skipLibCheck":true
```

2、use jwt