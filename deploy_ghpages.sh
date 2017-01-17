#!/bin/sh

if [ -z $1 ]; then
    BRANCH="master"
    REPO="w20-framework.github.io"
    DIR="public"
    CHANNEL="stable"
else
    BRANCH="gh-pages"
    REPO="${1}"
    DIR=${1}
    CHANNEL=${1}
fi

(
    cd ${DIR} || exit
    git init
    git config user.name "Travis-CI"
    git config user.email "travis@w20-framework.org"
    git add .
    git commit -m "${CHANNEL}-channel website generated by Hugo"
    git push --force --quiet "https://${GITHUB_TOKEN}@github.com/w20-framework/${REPO}" master:${BRANCH} > /dev/null 2>&1
)