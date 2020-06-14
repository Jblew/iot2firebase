#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

source ./iot.config.sh

if [ -z "${DEVICE_NAME}" ]; then
    echo "DEVICE_NAME env is not set"
    exit 1
fi

gcloud iot devices describe $DEVICE_NAME \
  --project=$GCP_PROJECT_ID \
  --region=$GCP_PROJECT_REGION \
  --registry=$GCP_IOT_REGISTRY_NAME
