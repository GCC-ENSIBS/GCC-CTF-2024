FROM debian:stable-slim

RUN apt update -y && \
    apt install git curl python3 python3-pip supervisor -y && \
    python3 -m pip install eth_account flask requests web3 gunicorn --break-system-packages && \
    useradd -m -s /bin/bash user

COPY ./src/supervisor/supervisord.conf /etc/supervisor/conf.d/
COPY ./src/blockchain/ /home/user/blockchain/
COPY ./src/app/ /home/user/app/

RUN chown -R user:user /home/user/

USER user

RUN curl -L https://foundry.paradigm.xyz | bash && \
    /home/user/.foundry/bin/foundryup && \
    echo 'alias ll="ls -lah"' >> /home/user/.bashrc

RUN cd /home/user/blockchain && \
    /home/user/.foundry/bin/forge install 'openzeppelin/openzeppelin-contracts@release-v5.0' --no-git && \
    /home/user/.foundry/bin/forge build && \
    /home/user/.foundry/bin/forge compile
    
USER root

RUN rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

EXPOSE 8000

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
