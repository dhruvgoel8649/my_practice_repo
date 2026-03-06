FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir django==5.0.1 django-cors-headers gunicorn
EXPOSE 8000
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
