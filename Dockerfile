FROM python:3.11-slim
WORKDIR /app
RUN groupadd -g 1001 appgroup && useradd -r -u 1001 -g appgroup appuser
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN chown -R appuser:appgroup /app
USER appuser
EXPOSE 8000
ENV PORT=8000
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')" || exit 1
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]