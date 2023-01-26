FROM harbor-west.esri.com/runtime-docker-public/ubuntu:16.04

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
  && \
  rm -rf /var/lib/apt/lists/* /tmp/* \
  && \
  echo "Done"

# clang
ENV clang_version="11.0.0"
RUN \
  curl --silent --insecure https://runtime-zip.esri.com/userContent/apps-archive/archive/local_system_setup/runtimecore/linux/${clang_version}_clang_libc++_x64.tar.gz | tar xzP \
  && \
  echo DONE

