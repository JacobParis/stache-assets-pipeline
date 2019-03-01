#!/usr/bin/env bash

# Creates the deployable Lambda zip

# Usage:
#   2-package.sh lambda_name
set -e

lambda_name=$1

mkdir -p .temp

rm -rf bin
mkdir -p bin

cp -r *.js package.json .temp/

pushd .temp
npm install --production
zip -r ../bin/$lambda_name.zip .
popd

rm -rf .temp