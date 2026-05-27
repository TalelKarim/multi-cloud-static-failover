#!/bin/bash

set -e

CLOUD_PROVIDER=$1

rm -rf dist
mkdir -p dist

cp app/index.html dist/
cp app/script.js dist/
cp app/styles.css dist/



sed "s/__CLOUD_PROVIDER__/${CLOUD_PROVIDER}/g" \
  app/runtime-config.template.json \
  > dist/runtime-config.json

echo "Build generated for ${CLOUD_PROVIDER}"