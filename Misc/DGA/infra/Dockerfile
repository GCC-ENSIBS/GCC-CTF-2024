# This docker file is only for example, it should be adapted to your use case.
FROM ghcr.io/downunderctf/docker-vendor/nsjail:ubuntu-22.04

ENV JAIL_CWD=/chal
ENV TIME_LIMIT=1800
ENV CPU_SHARES_MS=200
ENV MAX_PIDS=24
ENV MAX_MEMORY=127108864


COPY ./requirements.txt /home/ctf/chal/requirements.txt
COPY ./src/secret.py /home/ctf/chal/secret.py
COPY ./src/other_dataset_dga.txt /home/ctf/chal/other_dataset_dga.txt
COPY ./src/other_dataset_legit.txt /home/ctf/chal/other_dataset_legit.txt

COPY ./src/challenge.py /home/ctf/chal/pwn

RUN python3 -m pip install -r /home/ctf/chal/requirements.txt
RUN chmod +x /home/ctf/chal/pwn

# To launch: docker build --tag "chall_name" . && docker run -p 1337:1337 --rm --privileged -it "chall_name"
# To try: nc localhost 1337
