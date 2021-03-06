#!/bin/sh

rm -rf layer && unzip layer.zip -d layer

cd test

# Create zipfile for uploading to Lambda – we don't use this here
rm -f lambda.zip && zip -qyr lambda.zip index.ts

docker run --rm -v "$PWD":/var/task -v "$PWD"/../layer:/opt lambci/lambda:provided index.handler
