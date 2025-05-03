#!/usr/bin/env bash

# Start the extension in browser
echo '* ----------------------------------------------'
echo '* Starting zowe-explorer web bundle in browser'
echo '* ----------------------------------------------'
pnpm install --frozen-lockfile
pnpm run start
