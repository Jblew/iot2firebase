#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

echo "# Installing iot2firebase"
echo "# Setting up IoT"
./iot/setup.sh
echo "# IoT setup done"

echo "# Deploying"
./functions/deploy.sh
echo "# Functions deploy done"
echo "# Iot2firebase installation done"
