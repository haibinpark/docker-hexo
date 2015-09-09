#!/bin/bash
echo "build at `date`"
cd /root/blog
git clean -f
git pull origin master
git fetch
git checkout -b {{BRANCH}} origin/{{BRANCH}}
hexo clean
hexo g &
sleep 10s
supervisorctl stop hexo
sleep 10s
supervisorctl start hexo
echo "built successfully"
