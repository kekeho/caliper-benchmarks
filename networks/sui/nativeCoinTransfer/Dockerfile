FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt install -y curl \
    git-all \
    libclang-dev \
    clang \
    libssl-dev \
    cmake \
    pkg-config

# install rust
RUN curl -o rustup-init.sh https://sh.rustup.rs
RUN chmod +x ./rustup-init.sh
RUN ./rustup-init.sh -y
ENV PATH=/root/.cargo/bin:$PATH
RUN rustup update stable

# install sui
RUN cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui

# copy config
COPY config/ /root/.sui/sui_config/
COPY run.sh /
