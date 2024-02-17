#!/bin/bash
export EXTRA_CORS_ALLOWED_ORIGINS '*'
export DISABLE_CORS_CHECKS 1
export DISABLE_CUSTOM_CORS_APIGATEWAY 1
# start LocalStack container in the background
echo "Starting LocalStack instance ..."
DEBUG=1 localstack start -d
localstack logs -f &

# start up demo app
echo "Deploying and starting up demo app ..."
cd localstack-demo && make start
