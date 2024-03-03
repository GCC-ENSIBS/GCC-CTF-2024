# --- Setup with Nginx and FastAPI ---
FROM python:3.11

WORKDIR /app

RUN apt-get update && \
    apt-get install --no-install-recommends -y chromium chromium-driver && \
	rm -rf /var/lib/apt/lists/*

COPY ./src/ /app

RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -m challenge && \
    chown -R challenge:challenge /app

USER challenge

EXPOSE 5000
CMD ["/usr/bin/env","python3.11", "/app/app.py"]
