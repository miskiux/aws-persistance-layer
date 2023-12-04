#!/bin/bash

package=$1

set -e

if [ -z "$package" ]; then
    echo "Error: Application name is not provided"
    exit 1
fi

echo starting $package deployment;

cd ./apps/$package;

npx serverless deploy --conceal;

echo deplyment is finished;

