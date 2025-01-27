FROM debian:latest


RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libssl-dev \
    libpcre3 \
    libpcre3-dev \
    zlib1g-dev \
    wget \
    curl \
    make \
    gcc \
    g++ \
    autoconf \
    pkg-config \
    libtool \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/TelegramMessenger/MTProxy.git /opt/mtproxy


WORKDIR /opt/mtproxy


RUN make V=1
RUN make install

# پیکربندی و راه‌اندازی MTProto Proxy
CMD ["./mtproto_proxy", "-u", "mtproto", "-p", "443", "--use-keys", "--config", "/opt/mtproxy/config/config.file"]
