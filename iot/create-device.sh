#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

source ./iot.config.sh

if [ -z "${DEVICE_NAME}" ]; then
    echo "DEVICE_NAME env is not set"
    exit 1
fi

gcloud config set project ${GCP_PROJECT_ID}

DEVICE_DIR="${DIR}/devices/${DEVICE_NAME}"
mkdir -p "${DEVICE_DIR}"


PRIVATE_KEY_FILE="${DEVICE_DIR}/ec_private.pem"
PUBLIC_KEY_FILE="${DEVICE_DIR}/ec_public.pem"

# Generate an Eliptic Curve (EC) ES256 private / public key pair
openssl ecparam -genkey -name prime256v1 -noout -out "${PRIVATE_KEY_FILE}"
openssl ec -in "${PRIVATE_KEY_FILE}" -pubout -out "${PUBLIC_KEY_FILE}"

# Create a new Cloud IoT device
gcloud iot devices create "$DEVICE_NAME" \
  --region=$GCP_PROJECT_REGION \
  --registry=$REGISTRY_NAME \
  --public-key="path=${PUBLIC_KEY_FILE},type=es256"

DEVICE_CONFIG_FILE="${DEVICE_DIR}/device.env"
cat >"${DEVICE_CONFIG_FILE}" <<EOF
DEVICE_NAME="${DEVICE_NAME}"
EOF
