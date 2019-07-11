#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)

cd ${runPath}

installPath=${runPath}/kernels/py3-tensorflow

# check virtualenv version
virtualenv --version

mkdir -p ${installPath}
virtualenv --system-site-packages -p python3.7 ${installPath}

source ${installPath}/bin/activate

pip install --upgrade tensorflow
pip install --upgrade ipykernel

python -m ipykernel install --user --name=py3-tensorflow
