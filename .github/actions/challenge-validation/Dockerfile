FROM alpine:3.18.4

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache python3 py3-pip && \
    python3 -m pip install ctfcli && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]