#
# Ubuntu 14.04 with activiti Dockerfile
#
# Pull base image.
FROM cloudcube/base

MAINTAINER David "zhaohaibin@outlook.com"

ENV REFRESHED_AT 2015-09-09 12:00

USER root

RUN \
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y nodejs curl git-core && \
    update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10 && \
    curl -L https://npmjs.org/install.sh | sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN mkdir blog && cd blog && \
    npm install hexo-cli -g

WORKDIR /root/blog/

VOLUME ["/root/blog/source"]
VOLUME ["/root/blog/themes"] 

RUN echo "export LC_ALL=C" >> /root/.bashrc                                               

EXPOSE 4000

EXPOSE 22 

ADD assets /hexo
ADD config/hexo.conf /etc/supervisor/conf.d/hexo.conf
ADD adds/deploy.js /root/deploy.js
ADD assets/build.sh /root/deploy-blog.sh
ADD config/auto_publish_hexo.conf /etc/supervisor/conf.d/auto_publish_hexo.conf
ADD config/config /root/.ssh/config

RUN ln -sf /hexo/startup /root/startup

WORKDIR /root

CMD ["/hexo/startup"]
