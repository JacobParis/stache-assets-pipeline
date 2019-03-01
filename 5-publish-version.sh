#!/usr/bin/env bash

# Publishes the version $LATEST Lambda with the build number as description
#
# Usage:
#   5-publish-version.sh lambda_name build_number

set -e

lambda_name=$1
build_number=$2

if [ -z "$AWS_DEFAULT_REGION" ]; then
    aws_region="us-east-1"
else
    aws_region=$AWS_DEFAULT_REGION
fi

aws lambda publish-version --function-name $lambda_name --description $build_number --region $aws_region