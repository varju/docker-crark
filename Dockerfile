FROM debian:jessie
MAINTAINER Alex Varju <alex@varju.ca>

RUN dpkg --add-architecture i386 \
  && sed -i "s/jessie main/jessie main contrib non-free/" /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y curl unrar libc6-i386 ocl-icd-libopencl1:i386 lib32stdc++6 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/crark

WORKDIR /opt/crark

RUN curl -o /tmp/crark.rar http://www.crark.net/download/crark34-linux-opencl.rar \
  && unrar e '-pOpenCL aware' /tmp/crark.rar \
  && rm -f /tmp/crark.rar \
  && ln -s /opt/crark/crark /usr/local/bin
