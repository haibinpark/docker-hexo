#!/bin/bash
echo "build at `date`"
cd /root/blog
git reset --hard origin/master
git clean -f
git pull
git checkout master
hexo clean
hexo d -g
echo "built successfully"
