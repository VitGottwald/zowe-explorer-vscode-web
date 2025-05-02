#!/usr/bin/env bash

function fcho() {
  echo '* ----------------------------------------------'
  echo "$*"
  echo '* ----------------------------------------------'
}

# Build dependencies in the `zowe-cli` module
fcho '* Entering zowe-cli submodule'
cd zowe-cli
fcho '* Installing zowe-cli node_modules'
npm ci
fcho '* Building zowe-cli'
npm run build
cd ..

# Build zowe-explorer-api
fcho '* Entering zowe-explorer-vscode submodule'
cd zowe-explorer-vscode
fcho '* Installing zowe-explorer-vscode node_modules'
pnpm install --frozen-lockfile
fcho '* Building zowe-explorer-vscode'
pnpm run build
cd ..

# Build zowe-explorer web bundle
fcho '* Entering zowe-explorer package'
cd zowe-explorer-vscode/packages/zowe-explorer
fcho '* Building zowe-explorer web bundle'
pnpm run build:web
cd ../../..

# Start the extension in browser
fcho '* Starting zowe-explorer web bundle in browser'
pnpm install --frozen-lockfile
pnpm run start
