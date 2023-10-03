FROM registry.cn-chengdu.aliyuncs.com/buf/alpine:3.18.3
WORKDIR /var/helm_home
ARG version=v3.13.0
RUN set -eux; \
    apk add --no-cache tzdata; \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    echo "Asia/Shanghai" >  /etc/timezone; \
    wget https://get.helm.sh/helm-$version-linux-amd64.tar.gz; \
    tar -zxvf helm-$version-linux-amd64.tar.gz; \
    mv /var/helm_home/linux-amd64/helm /usr/local/bin/helm; \
    rm -rf /var/helm_home/*

CMD ["helm","version"]

# docker build -f Dockerfile -t registry.cn-chengdu.aliyuncs.com/buf/helm:3.13-alpine --build-arg "version=v3.13.0" .