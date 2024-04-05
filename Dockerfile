FROM alpine:3.17

RUN apk add --no-cache \
    bash \
    netcat-openbsd \
    python3 \
    py3-pip \
    strace \
    openjdk17-jdk \
    go \
    bind-tools

RUN adduser -Ds /bin/bash compnet
RUN sed -i 's/\/bin\/ash/\/bin\/bash/' /etc/passwd
USER root
WORKDIR /home/compnet

COPY . /home/compnet/

RUN rm /home/compnet/chat_client_check/client.py \
    /home/compnet/dns_check/dns.py \
    /home/compnet/server_check/server.py \
    /home/compnet/http_server_check/server.py \
    /home/compnet/unreliable_chat_check/client.py

RUN pip install -r requirements.txt
