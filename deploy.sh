#!/bin/sh
cd sample/out
rev=$(git rev-parse --short HEAD)
git init
git config user.name ${USER_NAME}
git config user.email ${USER_MAIL}
git remote add upstream ${GIT_REMOTE}
git fetch upstream
git reset upstream/gh-pages
git add .
git commit -m "Rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages