#!/usr/bin/env bash

function fecho() {
  echo '* ----------------------------------------------'
  echo "$*"
  echo '* ----------------------------------------------'
}

# Build dependencies in the `zowe-cli` module
fecho '* Entering zowe-cli submodule'
cd zowe-cli
fecho '* Installing zowe-cli node_modules'
pnpm install --frozen-lockfile
fecho '* Building zowe-cli'
pnpm run build
cd ..

# Build zowe-explorer-api
fecho '* Entering zowe-explorer-vscode submodule'
cd zowe-explorer-vscode
fecho '* Installing zowe-explorer-vscode node_modules'
pnpm install --frozen-lockfile
fecho '* Building zowe-explorer-vscode'
pnpm run build
cd ..

# Build zowe-explorer web bundle
fecho '* Entering zowe-explorer package'
cd zowe-explorer-vscode/packages/zowe-explorer
fecho '* Building zowe-explorer web bundle'
pnpm run build:web
cd ../../..

# Start the extension in browser
fecho '* Starting zowe-explorer web bundle in browser'
pnpm install --frozen-lockfile
pnpm run start
