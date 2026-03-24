FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5003 \
    GUNICORN_WORKERS=4 \
    GUNICORN_TIMEOUT=120

WORKDIR /app

# Install dependencies first to optimize Docker layer caching.
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application source.
COPY . .

EXPOSE 5003

# ECS sets PORT when needed; Gunicorn serves Flask app object from app.py.
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT} --workers ${GUNICORN_WORKERS} --timeout ${GUNICORN_TIMEOUT} app:app"]
