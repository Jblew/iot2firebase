#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

nvm use v12
npm install -g firebase-tools
firebase deploy --only hosting
