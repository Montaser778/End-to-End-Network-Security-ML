# استخدام نسخة بايثون خفيفة
FROM python:3.9-slim

# ضبط مجلد العمل
WORKDIR /app

# نسخ ملف المتطلبات وتثبيت المكتبات فقط
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الكود
COPY . .

# أمر التشغيل
CMD ["python", "app.py"]
