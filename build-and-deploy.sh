#!/usr/bin/env bash

# Tests, packages, deploys, to DEV alias, etc...
# Usage:
#   build-and-deploy-to-dev.sh lambda_name build_number alias

set -e

path=$( dirname "${BASH_SOURCE[0]}" )

lambda_name=$1
build_number=$2
alias=$3

echo -e "\n==================== Execute Tests =============================\n"
# ./1-test.sh

echo -e "\n==================== Package Files =============================\n"
$path/2-package.sh $lambda_name

echo -e "\n==================== Deploy Lambda =============================\n"
$path/3-update-lambda.sh $lambda_name

echo -e "\n==================== Execute Integration Tests =================\n"
$path/4-integration-test.sh

echo -e "\n==================== Publish Lambda Version ====================\n"
$path/5-publish-version.sh $lambda_name $build_number

echo -e "\n==================== Update STAGE Lambda Alias ===================\n"
$path/6-update-stage-alias.sh $lambda_name $build_number