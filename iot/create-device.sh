#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"
set -e

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

echo "Creating device"
# Create a new Cloud IoT device
gcloud iot devices create "$DEVICE_NAME" \
  --region=$GCP_PROJECT_REGION \
  --registry=$GCP_IOT_REGISTRY_NAME \
  --public-key="path=${PUBLIC_KEY_FILE},type=es256"
echo "Device successfuly published to IoT registry"

DEVICE_CONFIG_FILE="${DEVICE_DIR}/device.env"
cat >"${DEVICE_CONFIG_FILE}" <<EOF
DEVICE_NAME="${DEVICE_NAME}"
EOF

PRIVKEY_HEX_FILE="${DEVICE_DIR}/ec_private.hextxt"

cat >"${PRIVKEY_HEX_FILE}" <<EOF
// Error: ${PRIVKEY_HEX_FILE} is not populated. You need to populate it manually.
To populate ec_private.hextxt:
1. Run openssl ec -in "${PRIVKEY_HEX_FILE}" -noout -text
2. Copy the bytes in priv: section.
3. Paste the bytes to this file replacing current content
4. Remove all newlines.

// The key length should be exactly the same as the key length bellow (32 pairs
// of hex digits). If it's bigger and it starts with "00:" delete the "00:". If
// it's smaller add "00:" to the start. If it's too big or too small something
// is probably wrong with your key.

EOF

