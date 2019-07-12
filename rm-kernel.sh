#!/bin/sh

if [ -e ~/Library/Jupyter/kernels/$1 ]; then
  read -t 5 -p "remove kernels: $1 ? (y/n): " ok
  ok=${ok:-'n'}
  if [ $ok = 'y' -o $ok = 'Y' ]; then
    rm -r ~/Library/Jupyter/kernels/$1
    echo remove kernels: $1 success.
  else
    echo remove skiped.
  fi
else
  echo Kernels $1 is not exist.
fi
echo '-------'
echo 'Now kernel list:'
ls -l ~/Library/Jupyter/kernels|awk '{if(NR>1)print $NF}'
