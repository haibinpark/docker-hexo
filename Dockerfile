#
# Ubuntu 14.04 with activiti Dockerfile
#
# Pull base image.
FROM cloudcube/base

MAINTAINER David "zhaohaibin@outlook.com"

ENV REFRESHED_AT 2015-09-1 7:00

# USER root

RUN \ apt-get update && \
    apt-get install -y nodejs curl git-core && \
    update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10 && \
      # install npm
      curl -L https://npmjs.org/install.sh | sh && \
      # clean up install cache
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN \
  mkdir blog && cd blog && \
  # install hexo
  npm install hexo-cli -g && \
  hexo init && tnpm install && \
  # install plugins for hexo
  npm install hexo-generator-sitemap --save && \
  npm install hexo-generator-feed --save && \
  npm install hexo-deployer-git --save && \
  npm un hexo-renderer-marked --save && \
  npm i hexo-renderer-markdown-it --save

WORKDIR /root/blog/

VOLUME ["/root/blog/source"]
VOLUME ["/root/blog/themes"] 

RUN echo "export LC_ALL=C" >> /root/.bashrc                                               

# Install Supervisor.

EXPOSE 4000

EXPOSE 22 

ADD assets /hexo

CMD ["/hexo/startup"]

