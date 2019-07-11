#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)

pythonInstallPath=${runPath}/python-runtime

# check virtualenv version
virtualenv --version

mkdir -p ${pythonInstallPath}
virtualenv --system-site-packages -p python3.7 ${pythonInstallPath}

# activate python-runtime
source ${pythonInstallPath}/bin/activate

pip install --upgrade jupyter
