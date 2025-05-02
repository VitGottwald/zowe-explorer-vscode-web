#!/usr/bin/env bash

# Build dependencies in the `zowe-cli` module
echo '* Entering zowe-cli submodule'
cd zowe-cli
echo 'Installing zowe-cli node_modules'
npm ci
echo 'Building zowe-cli'
npm run build
cd ..

# Build zowe-explorer-api
echo 'Entering zowe-explorer-vscode submodule'
cd zowe-explorer-vscode
echo 'Installing zowe-explorer-vscode node_modules'
pnpm install --frozen-lockfile
echo 'Building zowe-explorer-vscode'
pnpm run build

# Build zowe-explorer web bundle
echo 'Entering zowe-explorer package'
cd packages/zowe-explorer
echo 'Building zowe-explorer web bundle'
pnpm run build:web

# Start the extension in browser
echo 'Starting zowe-explorer web bundle in browser'
npx @vscode/test-web --extensionDevelopmentPath=. --browserOption=--disable-web-security ../../../workspace
