#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)
installPath=${runPath}/kernels/py3-my-workbench

function kernel_install {
  cd ${runPath}
  # check virtualenv version
  virtualenv --version

  mkdir -p ${installPath}
  virtualenv --system-site-packages -p python3.7 ${installPath}

  source ${installPath}/bin/activate

  pip install --force-reinstall ipykernel

  python -m ipykernel install --user --name=py3-my-workbench
}

arg1=$1
if [ ${arg1:-''} = '-t' ];then
  if [ -e $installPath ]; then
    cd ${installPath}
    source ${installPath}/bin/activate
  else
    kernel_install
    cd ${installPath}
  fi
  bash
else
  kernel_install
fi
