#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)

installPath=${runPath}/kernels/nodejs

function kernel_install {
  cd ${runPath}

  source python-runtime/bin/activate

  mkdir -p kernels/nodejs

  npm i -g ijavascript

  ijsinstall --working-dir=$installPath
}

if [ $1 = '-t' ];then
  if [ ! -e $installPath ]; then
    kernel_install
  fi
  cd ${installPath}
  export PS1="(nodejs) "
  bash
else
  kernel_install
fi
