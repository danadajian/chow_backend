#!/bin/bash -e

BUCKET_NAME="chow-app"

if aws s3api head-bucket --bucket "${BUCKET_NAME}" 2>/dev/null; then
  echo "### Bucket exists: $BUCKET_NAME"
else
  echo "### Bucket does not exist, creating: ${BUCKET_NAME}"
  aws s3 mb s3://"${BUCKET_NAME}"
fi

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
export FILE_NAME="chow-$TIMESTAMP.zip"

zip -r -qq "$FILE_NAME" src
echo "### Zipped $FILE_NAME successfully."

aws s3 rm "s3://${BUCKET_NAME}" --recursive --exclude "*" --include "*.zip"
aws s3 cp "${FILE_NAME}" "s3://${BUCKET_NAME}/"