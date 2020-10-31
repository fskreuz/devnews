#!/usr/bin/env bash

set -ex

git config user.name 'DevNewsBot'
git config user.email '<>'

# The actions environment should not have a local pages branch. Otherwise, this
# command won't work. We only know of pages as a remote branch, and why the
# later push commit will be HEAD:pages.
git checkout --orphan pages

# Build the pages.
node aggregator.mjs build

# Commit contents of public as if it were the at repo root and push to pages.
git --work-tree public add --all
git --work-tree public commit -m "Update pages"
git push origin HEAD:pages -f
