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

# کلون کردن پروژه MTProto Proxy
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /opt/mtproxy

# نصب MTProto Proxy
WORKDIR /opt/mtproxy
RUN make && make install

# تنظیم پورت و سکرت
EXPOSE 443

# فرمان اجرای پروکسی با پارامترهای لازم
CMD ["./mtproto_proxy", "-p", "443", "-s", "ff543ebef83147d3da80042d24e2999e", "-t", "aa5dd98949ac427e013fd9840648520e"]
