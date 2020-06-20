#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"
set -e

source ./functions.config.sh

if [ -z "${GCP_PUBSUB_TOPIC}" ]; then
    echo "GCP_PUBSUB_TOPIC env is not set"
    exit 1
fi

if [ -z "${GCP_PROJECT_REGION}" ]; then
    echo "GCP_PROJECT_REGION env is not set"
    exit 1
fi

./generate-config.sh

gcloud config set project ${GCP_PROJECT_ID}

gcloud functions deploy AddRowOnPubSub \
  --trigger-topic "${GCP_PUBSUB_TOPIC}" \
  --region "${GCP_PROJECT_REGION}" \
  --runtime go113 \
  --memory "1024MB"

