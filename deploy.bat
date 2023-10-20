@echo off
REM Change directory to the output directory
cd sample\out

REM Get the Git commit hash
for /f %%i in ('git rev-parse --short HEAD') do set rev=%%i

REM Initialize a new Git repository
git init

REM Configure Git user information
git config user.name "nishantbuktare"
git config user.email "nishant.buktare@gmail.com"

REM Add and configure the remote repository
git remote add upstream "https://github.com/nishantbuktare/space-pages.git"
git fetch upstream

REM Reset the repository to the latest commit
git reset upstream/gh-pages

REM Add changes to the Git repository
git add .

REM Commit the changes
git commit -m "Rebuild pages at %rev%"

REM Push the changes to the remote repository
git push -q upstream HEAD:gh-pages

echo Deployment process completed.
