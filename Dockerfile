# استفاده از تصویر پایه debian
FROM debian:latest

# به‌روزرسانی سیستم و نصب پیش‌نیازها
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# دانلود و اجرای اسکریپت نصب MTProto Proxy
RUN curl -L -o mtp_install.sh https://git.io/fj5ru && \
    bash mtp_install.sh -p 443 -s ff543ebef83147d3da80042d24e2999e -t aa5dd98949ac427e013fd9840648520e -a dd -a tls -d s3.amazonaws.com

# تنظیمات مورد نیاز برای اجرای پروکسی
CMD ["bash", "/opt/mtproto/mtp_proxy", "-u", "mtproto", "-p", "443"]
