#!/bin/bash -e

echo "### Initiating SAM Deploy..."

STACK_NAME="chow-stack"

sam --version
sam deploy --template-file ./template.yaml --stack-name "${STACK_NAME}" --capabilities CAPABILITY_IAM \
  --parameter-overrides BucketName="${BUCKET_NAME}" CodeKey="${FILE_NAME}" AwsKey="${AWS_ACCESS_KEY_ID}" \
   AwsSecret="${AWS_SECRET_ACCESS_KEY}" --no-fail-on-empty-changeset