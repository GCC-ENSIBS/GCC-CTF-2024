FROM debian:trixie@sha256:57b3949871ca74f5e9050c1b7295c445d51fd0cc6504672d7ea08c2a92feaac5

ENV TIMEZONE Europe/Paris

RUN apt-get update && apt-get install -y ssh && rm -rf /var/lib/apt/lists/*

RUN rm /bin/ls
COPY ./src/ls /usr/bin/ls
COPY ./src/flag.txt /root/flag.txt
COPY ./src/motd /etc/motd

RUN chown root:root /usr/bin/ls
RUN chmod 4755 /usr/bin/ls

RUN ssh-keygen -A
RUN mkdir -p /home/gccprod
RUN echo "Production server. May the code be with you." > /home/gccprod/note.txt
RUN useradd -u 666 --home=/home/gccprod -U gccprod
RUN echo 'gccprod:gccprod123!' | chpasswd

RUN mkdir -p /run/sshd

ENTRYPOINT ["/usr/sbin/sshd","-D"]
