#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)

cd ${runPath}

source python-runtime/bin/activate

mkdir -p kernels/nodejs

npm i -g ijavascript

ijsinstall --working-dir=${runPath}/kernels/nodejs
