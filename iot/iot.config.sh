#!/usr/bin/env bash
IOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load project config
"${IOT_DIR}/../project.config.sh"

export PUBSUB_TOPIC=iot2firebase-iotcore-topic
export PUBSUB_SUBSCRIPTION=iot2firebase-iotcore-subscription
export REGISTRY_NAME=iot2firebase-iotcore-registry
export CACERTS_FILE="${IOT_DIR}/gcp_roots.pem"
