#!/bin/bash

package=$1

set -e

if [ -z "$package" ]; then
    echo "Error: Application name is not provided"
    exit 1
fi

echo starting $package bundling;

./node_modules/.bin/webpack --env application_name=$package --config ./config/webpack.config.js

echo bundling is finished;
