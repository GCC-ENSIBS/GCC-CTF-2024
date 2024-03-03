FROM python:3.10-slim-buster

WORKDIR /website

COPY requirements.txt /website/requirements.txt
RUN pip3 install -r requirements.txt

COPY ./static /website/static/
COPY ./templates /website/templates/
COPY ./app.py /website/app.py

CMD [ "python3.10", "-m" , "flask", "run", "--host=0.0.0.0"]