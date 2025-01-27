# استفاده از تصویر پایه debian
FROM debian:latest

# نصب ابزارهای مورد نیاز
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libssl-dev \
    libpcre3 \
    libpcre3-dev \
    zlib1g-dev \
    wget \
    curl

# دانلود پروژه MTProto Proxy از گیت‌هاب
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /opt/mtproxy

# نصب MTProto Proxy
WORKDIR /opt/mtproxy
RUN make && make install

# پیکربندی MTProto Proxy و شروع به کار آن
CMD ["./mtproto_proxy", "-u", "mtproto", "-p", "443"]
