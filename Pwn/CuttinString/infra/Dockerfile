FROM ghcr.io/downunderctf/docker-vendor/nsjail:ubuntu-22.04

ENV JAIL_CWD=/chal
ENV TIME_LIMIT=180
#Copy files in the docker
COPY ./src/chall /home/ctf/chal/pwn
COPY ./src/flag.txt /home/ctf/chal/flag.txt

#Change perms
RUN chmod 755 /home/ctf/chal/pwn
RUN chmod 744 /home/ctf/chal/flag.txt

# Autorun by downunderctf