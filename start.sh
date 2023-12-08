#!/bin/bash

package=$1

set -e

if [ -z "$package" ]; then
    echo "Error: Application name is not provided"
    exit 1
fi

echo starting $package;

cp ./.env ./apps/$package/.env;

cd ./apps/$package;

npx serverless offline;

echo started the $package;
