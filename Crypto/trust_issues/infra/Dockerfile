FROM python:3.11-slim

WORKDIR /app

RUN pip install \
    fastapi \
    jinja2 \
    pydantic \
    uvicorn \
    timosbadlibraries

COPY src/static static
COPY src/templates templates
COPY src/api.py .
COPY src/flag.py .
COPY src/chall.py .

# allow 1001 to access flag.py
RUN chown -R 1001:1001 /app

USER 1001

EXPOSE 8080

CMD ["uvicorn", "chall:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8080"]