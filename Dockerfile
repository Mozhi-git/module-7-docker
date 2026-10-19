FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN useradd -m appuser && mkdir -p /app/qr_codes /app/logs && chown -R appuser:appuser /app/qr_codes /app/logs
COPY --chown=appuser:appuser main.py /app/
USER appuser
ENTRYPOINT ["python", "main.py"]
CMD ["--url", "https://www.njit.edu"]
