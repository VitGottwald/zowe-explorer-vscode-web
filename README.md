# ZOWE Explorer WEB

A repo to tie together matching commits of ZOWE Explorer and ZOWE CLI (a dependency of ZOWE Explorer) and build them into a VS Code WEB compatible extension.

## Clone

``` sh
git clone --recurse-submodules https://github.com/VitGottwald/zowe-explorer-vscode-web.git
cd zowe-explorer-vscode-web
```

## Dependencies

- pnpm 10.8.1

To install it, run

```
curl -fsSL https://get.pnpm.io/install.sh | env PNPM_VERSION=10.8.1 bash -
```

## Build and run

```
./BUILD.sh
```
