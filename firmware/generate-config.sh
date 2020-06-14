#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"
set -e

source ./firmware.config.sh

if [ -z "${DEVICE_NAME}" ]; then
    echo "DEVICE_NAME env is not set"
    exit 1
fi

if [ -z "${DEVICES_DIR}" ]; then
    echo "DEVICE_NAME env is not set"
    exit 1
fi

if [ -z "${GCP_PROJECT_ID}" ]; then
    echo "GCP_PROJECT_ID env is not set"
    exit 1
fi

if [ -z "${GCP_PROJECT_REGION}" ]; then
    echo "GCP_PROJECT_REGION env is not set"
    exit 1
fi

if [ -z "${GCP_IOT_REGISTRY_NAME}" ]; then
    echo "GCP_IOT_REGISTRY_NAME env is not set"
    exit 1
fi

if [ -z "${WIFI_SSID}" ]; then
    echo "WIFI_SSID env is not set"
    exit 1
fi

if [ -z "${WIFI_PASSWORD}" ]; then
    echo "WIFI_PASSWORD env is not set"
    exit 1
fi

DEVICE_DIR="${DEVICES_DIR}/${DEVICE_NAME}"
DEVICE_PRIVKEY_HEX_FILE="${DEVICE_DIR}/ec_private.hextxt"
PRIVKEY_HEX=$(cat "${DEVICE_PRIVKEY_HEX_FILE}")


CONFIG_FILE="${DIR}/src/ciotc_config_secrets.h"

cat >"${CONFIG_FILE}" <<EOF
// WiFi password
const char *ssid = "${WIFI_SSID}";
const char *password = "${WIFI_PASSWORD}";

const char *device_id = "${DEVICE_NAME}";
const char *project_id = "${GCP_PROJECT_ID}";
const char *location = "${GCP_PROJECT_REGION}";
const char *registry_id = "${GCP_IOT_REGISTRY_NAME}";

// To get the private key run (where private-key.pem is the ec private key
// used to create the certificate uploaded to google cloud iot):
// openssl ec -in <private-key.pem> -noout -text
// and copy priv: part.
// The key length should be exactly the same as the key length bellow (32 pairs
// of hex digits). If it's bigger and it starts with "00:" delete the "00:". If
// it's smaller add "00:" to the start. If it's too big or too small something
// is probably wrong with your key.
const char *private_key_str =
    "${PRIVKEY_HEX}";

EOF
