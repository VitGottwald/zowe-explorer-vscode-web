# Build dependencies in the `zowe-cli` module
cd zowe-cli
npm ci
npm run build
cd ..

# Build zowe-explorer-api
cd zowe-explorer-vscode
pnpm install --frozen-lockfile
pnpm run build

# Build zowe-explorer web bundle
cd packages/zowe-explorer
pnpm run build:web

# Start the extension in browser
npx @vscode/test-web --extensionDevelopmentPath=. --browserOption=--disable-web-security ../../../workspace
