#!/bin/bash

set -ex
hugo
cd public
git add .

msg="rebuilding site `date`"
git commit -m "$msg"

git push origin master