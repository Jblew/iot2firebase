#!/usr/bin/env bash
IOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load project config
source ${IOT_DIR}/../project.config.sh

export PUBSUB_SUBSCRIPTION=deviceevents-subscription
export CACERTS_FILE="${IOT_DIR}/gcp_roots.pem"
