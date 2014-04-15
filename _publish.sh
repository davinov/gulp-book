#!/bin/bash

gitbook build
MESSAGE=$(git log -1 HEAD --pretty=format:%s)
echo $MESSAGE
cd _book
git init
git remote add origin git@github.com:davinov/gulp-book.git
git checkout -b gh-pages
git add .
git commit -m "$MESSAGE"
git push origin gh-pages -f
cd ..
