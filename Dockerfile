# انتخاب تصویر پایه Debian
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
    curl \
    clang \
    make \
    python3

# کلون کردن پروژه MTProto Proxy از گیت‌هاب
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /opt/mtproxy

# نصب MTProto Proxy
WORKDIR /opt/mtproxy

# استفاده از حالت verbose در make برای نمایش دقیق‌تر خطاها
RUN make V=1

# نصب MTProto Proxy
RUN make install

# تنظیم پورت و سکرت‌ها از متغیرهای محیطی
ENV MTP_PORT 443
ENV MTP_SECRET ff543ebef83147d3da80042d24e2999e
ENV MTP_TAG aa5dd98949ac427e013fd9840648520e

# باز کردن پورت 443
EXPOSE 443

# فرمان اجرای پروکسی با پارامترهای پیکربندی شده
CMD ["./mtproto_proxy", "-p", "443", "-s", "$MTP_SECRET", "-t", "$MTP_TAG"]
