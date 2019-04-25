#!/bin/bash

set -ex
hugo
cd public
git add .

msg="rebuilding site `date +'%Y-%m-%d %H:%M:%S'`"
git commit -m "$msg"

git push origin master