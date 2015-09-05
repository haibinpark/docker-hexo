#!/bin/bash
echo "build at `date`"
cd /root/blog
git remote add origin {{GITHUB_REMOTE_ADDR}}
git reset --hard origin/master
git clean -f
git pull
git checkout master
hexo clean
hexo d -g
echo "built successfully"
