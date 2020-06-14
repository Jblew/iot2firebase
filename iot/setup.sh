#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

source ./iot.config.sh

gcloud config set project ${GCP_PROJECT_ID}

gcloud pubsub topics create "${PUBSUB_TOPIC}"
gcloud iot registries create $REGISTRY_NAME \
  --region=$GCP_PROJECT_REGION \
  --event-notification-config=subfolder="",topic=${PUBSUB_TOPIC}

