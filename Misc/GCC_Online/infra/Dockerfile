FROM debian:trixie@sha256:57b3949871ca74f5e9050c1b7295c445d51fd0cc6504672d7ea08c2a92feaac5

ENV TIMEZONE Europe/Paris

RUN apt-get update && apt-get install -y gcc \
    python3 \
    python3-pip \
    python3-venv && \
    apt clean && \
    rm -rf /var/lib/apt/lists/

RUN useradd gccuser
RUN mkdir /data/
RUN chown -R gccuser:gccuser /data
COPY --chown=gccuser:gccuser ./entrypoint.sh /entrypoint.sh
COPY --chown=gccuser:gccuser ./src /data/
USER gccuser
WORKDIR /data
RUN python3 -m venv venv
RUN /data/venv/bin/pip install -r requirements.txt

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
