#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)

installPath=${runPath}/kernels/typescript

function kernel_install {
  mkdir -p $installPath
  cd $installPath
  if [ ! -e package.json ];then
    cat>package.json<<EOF
{
  "name": "omy-jupyter-notebook-kernel-typescript",
  "version": "1.0.0",
  "description": "",
  "license": "MIT"
}
EOF
    npm i itypescript
  fi
  source ${runPath}/python-runtime/bin/activate
  itypescriptScript=node_modules/itypescript/bin/itypescript.js
  sed -i '' "s/\"\(jupyter --version\)\"/\"\1|grep 'jupyter core'|awk '{print \$NF}'\"/g" "$itypescriptScript"
  node $itypescriptScript --install=local
  kernelSpecPath=`jupyter kernelspec list|grep typescript|awk '{print $NF}'`
  kernelPath=${installPath}/node_modules/itypescript/lib/kernel.js
  cat>${kernelSpecPath}/kernel.json<<EOF
{
  "argv":["node","$kernelPath","{connection_file}","--protocol=5.1"],
  "display_name":"Typescript 3.5",
  "language":"typescript"
}
EOF
  jupyter kernelspec list
}

kernel_install
