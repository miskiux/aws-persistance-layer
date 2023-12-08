#!/bin/bash

package=$1

set -e

if [ -z "$package" ]; then
    echo "Error: Application name is not provided"
    exit 1
fi

if [ ! -d ./apps/$package/dist ]; then
    echo "Error: Distributable does not exist"
    exit 1
fi


echo starting $package deployment;

cp ./.env ./apps/$package/.env;

cd ./apps/$package;

npx serverless deploy --conceal;

echo deplyment is finished;

