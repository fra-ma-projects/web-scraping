# Multi-stage Docker build for Python and Rust services

# Python stage
FROM python:3.10-slim AS python_service
WORKDIR /app
COPY python_service/requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY python_service/ /app/
