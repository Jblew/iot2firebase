#!/usr/bin/env bash
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export NTP_SERVER=time.google.com
export DEVICES_DIR="${PROJECT_DIR}/iot/devices/"
export DEVICE_CONFIG_FILENAME="device.config.sh"
export GCP_PROJECT_ID="things2firebase"
export GCP_PROJECT_REGION="europe-west1"
export PUBSUB_TOPIC=deviceevents
