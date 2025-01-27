# از یک تصویر پایه Debian استفاده می‌کنیم
FROM debian:latest

# به‌روزرسانی سیستم و نصب پیش‌نیازها
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
    && rm -rf /var/lib/apt/lists/*

# کلون کردن مخزن MTProto Proxy از گیت‌هاب
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /opt/mtproxy

# وارد شدن به دایرکتوری mtproxy
WORKDIR /opt/mtproxy

# ساخت و نصب MTProto Proxy
RUN make && make install

# پیکربندی و راه‌اندازی MTProto Proxy
# توجه داشته باشید که در اینجا باید پارامترهای مناسب برای کاربری که می‌خواهید ایجاد کنید را قرار دهید
CMD ["./mtproto_proxy", "-u", "mtproto", "-p", "443", "--use-keys", "--config", "/opt/mtproxy/config/config.file"]
