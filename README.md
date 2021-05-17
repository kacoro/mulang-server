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
yarn dev2



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

