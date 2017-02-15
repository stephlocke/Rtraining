#!/bin/bash
FULL_REPO="https://$GH_TOKEN@github.com/$TRAVIS_REPO_SLUG.git"

git clone $FULL_REPO out --branch gh-pages
cd out
git config user.name "stephs-travis"
git config user.email "steph@travis.ci"

cd ..
R CMD BATCH '../Rtraining/ghgenerate.R'

cp ghgenerate.Rout out
cd out

git add .
git commit -m "$TRAVIS_COMMIT"
git push --quiet $FULL_REPO