FROM debian:trixie@sha256:57b3949871ca74f5e9050c1b7295c445d51fd0cc6504672d7ea08c2a92feaac5

ENV TIMEZONE Europe/Paris

RUN apt-get update && apt-get install -y socat patchelf && rm -rf /var/lib/apt/lists/*

COPY /src/flag_roulette /src/flag_roulette
COPY /src/flag.txt /flag
COPY /src/ld-linux-x86-64.so.2 /src/ld-linux-x86-64.so.2
COPY /src/pwninit /src/pwninit
COPY /src/libc.so.6 /src/libc.so.6

RUN chmod 444 /flag

WORKDIR /src

RUN chmod 505 /src/flag_roulette && chmod +x /src/pwninit
RUN /src/pwninit --bin /src/flag_roulette --libc /src/libc.so.6 --ld /src/ld-linux-x86-64.so.2 && \
    rm /src/flag_roulette && \
    mv /src/flag_roulette_patched /src/flag_roulette

RUN useradd -u 666 --home=/challenge -U challenge

USER challenge

ENV SOCAT_OPTIONS=",stderr,pty,cfmakeraw,echo=0"

ENTRYPOINT ["sh", "-c", "socat TCP-LISTEN:1337,reuseaddr,fork EXEC:/src/flag_roulette${SOCAT_OPTIONS}"]
