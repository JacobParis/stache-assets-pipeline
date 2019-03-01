#!/usr/bin/env bash

# Deploys the Lambda .zip file to AWS Lambda as version $LATEST

# Usage:
#   3-update-lambda.sh lambda_name
set -e

lambda_name=$1
zip_file="./bin/$lambda_name.zip"

if [ -z "$AWS_DEFAULT_REGION" ]; then
    aws_region="us-east-1"
else
    aws_region=$AWS_DEFAULT_REGION
fi

aws lambda update-function-code --function-name $lambda_name --zip-file fileb://$zip_file --region $aws_region