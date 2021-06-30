module.exports = {
    apps: [
      {
        name: 'cst-server',
        exec_mode:  'cluster', // 'fork',
        instances: '2', // max Or a number of instances ，仅在cluster模式有效
        script: './dist/index.js',
        env: {
          "NODE_ENV": "development",
        },
        env_production : {
           "NODE_ENV": "production"
        }
      },
     
    ]
  }