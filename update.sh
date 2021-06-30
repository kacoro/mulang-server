#!/bin/bash
echo "scp start"

scp -rv dist public .env .env.example ecosystem.config.js package.json tsconfig.json yarn.lock root@129.226.142.123:/data/website/cst/server  

echo "scp end"