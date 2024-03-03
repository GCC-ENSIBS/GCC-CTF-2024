FROM debian:trixie@sha256:57b3949871ca74f5e9050c1b7295c445d51fd0cc6504672d7ea08c2a92feaac5

ENV TIMEZONE Europe/Paris

RUN apt-get update && apt-get install -y ncat patchelf && rm -rf /var/lib/apt/lists/*

COPY ./src /src
RUN chmod 400 /src/baby_bof.c
RUN chmod 500 /src/compilation_baby_bof.sh
RUN chmod 444 /src/flag.txt

WORKDIR /src

RUN chmod 505 /src/baby_bof && chmod +x /src/pwninit
RUN /src/pwninit --bin /src/baby_bof && \
    rm /src/baby_bof && \
    mv /src/baby_bof_patched /src/baby_bof


RUN useradd -u 666 --home=/challenge -U challenge

USER challenge

CMD ["sh", "-c", "ncat -e /src/baby_bof -l 1337 -k"]
