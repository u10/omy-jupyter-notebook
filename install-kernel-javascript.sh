#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)

installPath=${runPath}/kernels/javascript

function kernel_install {
  mkdir -p $installPath
  cd $installPath
  if [ ! -e package.json ];then
    cat>package.json<<EOF
{
  "name": "omy-jupyter-notebook-kernel-javascript",
  "version": "1.0.0",
  "description": "",
  "license": "MIT"
}
EOF
    npm i ijavascript
  fi
  source ${runPath}/python-runtime/bin/activate
  node node_modules/ijavascript/bin/ijsinstall.js
  kernelSpecPath=`jupyter kernelspec list|grep javascript|awk '{print $NF}'`
  kernelPath=${installPath}/node_modules/ijavascript/lib/kernel.js
  cat>${kernelSpecPath}/kernel.json<<EOF
{
  "argv":["node","$kernelPath","--hide-undefined","{connection_file}","--protocol=5.1"],
  "display_name":"Javascript (Node.js)",
  "language":"javascript"
}
EOF

  echo $kernelPath
  cat $kernelSpecPath/kernel.json
}

kernel_install
