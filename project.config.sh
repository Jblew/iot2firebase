#!/usr/bin/env bash
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${PROJECT_DIR}/secrets.config.sh"

export NTP_SERVER=time.google.com
export DEVICES_DIR="${PROJECT_DIR}/iot/devices/"
export DEVICE_CONFIG_FILENAME="device.config.sh"
export GCP_PROJECT_ID="things2firebase"
export GCP_PROJECT_REGION="europe-west1"
export GCP_PUBSUB_TOPIC="deviceevents"
export GCP_IOT_REGISTRY_NAME="iot2firebase-registry"
