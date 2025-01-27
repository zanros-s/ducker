# استفاده از تصویر پایه Debian
FROM debian:latest

# نصب پیش‌نیازها
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libssl-dev \
    libpcre3 \
    libpcre3-dev \
    zlib1g-dev \
    wget \
    curl

 run -d --network=host seriyps/mtproto-proxy -p 443 -s ff543ebef83147d3da80042d24e2999e -t aa5dd98949ac427e013fd9840648520e



# تنظیم پورت و سکرت
EXPOSE 443
