#!/bin/bash

gitbook build
MESSAGE=$(git log -1 HEAD --pretty=format:%s)
cd _book
git add --all .
git commit -m "$MESSAGE"
git push origin gh-pages
cd ..
