FROM python:3.11

COPY src /app
WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

RUN adduser --no-create-home webapp
RUN chown -R webapp:webapp /app

USER webapp

EXPOSE 8080

CMD ["python", "app.py"]
