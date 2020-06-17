#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

echo "# Installing iot2firebase"
echo "# Setting up IoT"
./iot/setup.sh
echo "# IoT setup done"

echo "# Generating config files for firmware"
./firmware/generate-config.sh
echo "# Generating config files for firmware done"

echo "# Deploying functions"
./functions/deploy.sh
echo "# Functions deploy done"

echo "# Deploying panel"
./panel/deploy.sh
echo "# Functions panel done"

echo "# Firestore"
echo "!!! Please update firestore rules manually (use firestore.rules file)"
echo ""

echo "# Iot2firebase installation done"
