FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

ENV FORCE_UNSAFE_CONFIGURE=1

# install some packages
RUN apt-get update && apt-get install -y \
    build-essential clang flex bison g++ gawk gcc-multilib g++-multilib \
    gettext git libncurses5-dev libssl-dev python3-venv rsync unzip zlib1g-dev file wget \
    python3 python3-pip python3-setuptools python3-pyelftools \
    subversion swig time libz-dev libpython3-dev \
    && rm -rf /var/lib/apt/lists/*


# clone OpenWRT
WORKDIR /openwrt
RUN git clone https://github.com/openwrt/openwrt.git .

RUN ./scripts/feeds update -a

RUN ./scripts/feeds install -a

# copy config and custom package
COPY custom_package ./package/custom_package
COPY opi_z3.config .config

# set default config
RUN make defconfig

# build 
RUN make -j$(nproc) V=s
