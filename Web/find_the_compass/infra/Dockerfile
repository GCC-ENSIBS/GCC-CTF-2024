FROM python:3.11-alpine3.19

WORKDIR /usr/src/app

RUN addgroup ftc
RUN adduser --system --no-create-home ftc

COPY ./find_the_compass/ /usr/src/app/find_the_compass

COPY ./setup.py /usr/src/app/setup.py

COPY ./flag.txt /usr/src/app/flag.txt

RUN pip install -e .

RUN chown -R ftc:ftc /usr/src/app

USER ftc

EXPOSE 5000

CMD [ "flask", "--app", "find_the_compass", "run", "--port=5000" , "--host=0.0.0.0", "--with-threads"]