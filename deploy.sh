#!/bin/sh

echo "Deployment process started..."

cd sample/out

echo "Initializing Git repository..."
rev=$(git rev-parse --short HEAD)
git init

echo "Configuring Git user..."
git config user.name "nishantbuktare"
git config user.email "nishant.buktare@gmail.com"

echo "Adding and configuring the remote repository..."
git remote add upstream "https://github.com/nishantbuktare/space-pages.git"
git fetch upstream

echo "Resetting the repository to the latest commit..."
git reset upstream/gh-pages

echo "Adding changes to the Git repository..."
git add .

echo "Committing changes..."
git commit -m "Rebuild pages at ${rev}"

echo "Pushing changes to the remote repository..."
git push -q upstream HEAD:gh-pages

echo "Deployment process completed."
