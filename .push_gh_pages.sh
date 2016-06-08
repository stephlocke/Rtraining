#!/bin/bash

rm -rf out || exit 0;
mkdir out;

GH_REPO="@github.com/stephlocke/Rtraining.git"

FULL_REPO="https://$GH_TOKEN$GH_REPO"

git clone https://github.com/stephlocke/RTraining.git out --branch gh-pages
cd out
git config user.name "stephs-travis"
git config user.email "travis"

cd ..
R CMD BATCH '../Rtraining/ghgenerate.R'

cp ghgenerate.Rout out
cd out

git add .
git commit -m "$TRAVIS_COMMIT"
git push --quiet $FULL_REPO