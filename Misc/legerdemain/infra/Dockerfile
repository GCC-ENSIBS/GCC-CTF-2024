# This docker file is only for example, it should be adapted to your use case.
FROM ghcr.io/downunderctf/docker-vendor/nsjail:ubuntu-22.04

ENV JAIL_CWD=/chal
ENV TIME_LIMIT=1800
ENV CPU_SHARES_MS=200
ENV MAX_PIDS=24
ENV MAX_MEMORY=127108864

COPY ./src/auto_chall.py /home/ctf/chal/pwn

RUN chmod +x /home/ctf/chal/pwn

# To launch: docker build --tag "chall_name" . && docker run -p 1337:1337 --rm --privileged -it "chall_name"
# To try: nc localhost 1337
