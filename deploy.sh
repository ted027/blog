#!/bin/bash

set -ex
la -al
hugo

cd public
git add

msg="rebuild site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin master
cd -