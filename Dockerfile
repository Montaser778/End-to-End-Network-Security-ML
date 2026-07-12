# استخدام صورة بايثون حديثة ومستقرة
FROM python:3.9-slim
# ضبط مجلد العمل
WORKDIR /app

# نسخ ملف المتطلبات أولاً لتسريع عملية البناء (Docker Layer Caching)
COPY requirements.txt .

# تثبيت المتطلبات وأدوات AWS
RUN apt-get update && apt-get install -y awscli && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /var/lib/apt/lists/*

# نسخ باقي الكود
COPY . .

# أمر التشغيل
CMD ["python", "app.py"]
