FROM ubuntu:20.04
LABEL maintainer Shawn

RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d && \
    apt-get -y update && \
    apt-get -yq install wget

COPY install.sh /app/proxy/install.sh

RUN /app/proxy/install.sh

COPY conf/app.toml /etc/gpa/app.toml

CMD proxy-admin start ; /bin/bash