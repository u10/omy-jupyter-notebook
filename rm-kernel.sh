#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)
pythonInstallPath=${runPath}/python-runtime

source ${pythonInstallPath}/bin/activate

jupyter kernelspec remove $1
jupyter kernelspec list
