#!/usr/bin/env bash

# Updates the STAGE alias to point to the Lambda version with the build number as description
#
# Usage:
#   6-update-stage-alias.sh lambda_version build_number

set -e

path=$( dirname "${BASH_SOURCE[0]}" )

lambda_version=$1
build_number=$2
alias="STAGE"

$path/update-alias.sh $lambda_version $build_number $alias