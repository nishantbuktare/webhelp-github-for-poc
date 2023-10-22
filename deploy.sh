#!/bin/sh

echo "Changing directory to 'sample/out'"
cd sample/out

echo "Getting the short Git revision hash"
rev=$(git rev-parse --short HEAD)

echo "Initializing a new Git repository"
git init
git config user.name "nishantbuktare"
git config user.email "nishant.buktare@gmail.com"

echo "Adding the upstream repository"
git remote add upstream "https://github.com/nishantbuktare/space-pages.git"

echo "Fetching the upstream repository"
git fetch upstream

echo "Resetting the repository to upstream's gh-pages branch"
git reset upstream/gh-pages

echo "Adding all files to the repository"
git add .

echo "Committing changes with the revision hash"
git commit -m "Rebuild pages at ${rev}"

echo "Pushing changes to the upstream's gh-pages branch"
git push -q upstream HEAD:gh-pages
