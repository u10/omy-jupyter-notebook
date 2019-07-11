#!/bin/sh

runPath=$(cd "$(dirname "$0")"; pwd)

# activate python-runtime
source ${runPath}/python-runtime/bin/activate

jupyter notebook
