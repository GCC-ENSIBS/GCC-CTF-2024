FROM python:3.12-bookworm

# docker build -t frenzy_flask . && docker run --rm -it -p 5000:5000 frenzy_flask

RUN mkdir /app
RUN useradd --create-home user && chown user:user /app

WORKDIR /app
USER user

COPY ./flag.txt /home/user/flag.txt

COPY requirements.txt /app
RUN pip install --user --no-cache-dir -r requirements.txt

RUN mkdir /app/notes

USER root
COPY ./src/ /app/src
RUN chown -R root:root /app/src
USER user
ENTRYPOINT ["python3", "/app/src/app.py"]
