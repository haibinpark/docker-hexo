#!/bin/bash
echo "build at `date`"
cd /root/blog
git clean -f
git pull
git fetch
git checkout b master origin/master
hexo clean
hexo d -g
echo "built successfully"
