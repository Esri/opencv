FROM harbor-west.esri.com/runtime-docker-public/ubuntu:20.04

# This stops krb5-user package from prompting for geographic region
ENV DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN \
  apt update \
  && \
  apt install -y \
  curl \
  cmake \
  ninja-build \
  unzip \
  && \
  rm -rf /var/lib/apt/lists/* /tmp/* \
  && \
  echo "Done"

# LLVM
ENV llvm_version="17.0.1"
RUN \
  mkdir -p /usr/local/rtc/llvm \
  && \
  curl --silent --insecure https://runtime-zip.esri.com/userContent/apps-archive/archive/local_system_setup/runtimecore/linux/llvm-${llvm_version}-x86_64.zip --output /tmp/llvm.zip \
  && \
  unzip /tmp/llvm.zip -d /usr/local/rtc/llvm \
  && \
  rm /tmp/llvm.zip \
  && \
  echo DONE

