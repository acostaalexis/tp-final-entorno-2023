FROM ubuntu:20.04

WORKDIR /app
COPY *.sh ./

RUN apt-get update && \
    apt-get install -y dos2unix wget imagemagick && \
    dos2unix *.sh && \
    chmod +x *.sh

VOLUME /output

CMD ["/bin/bash", "./menu.sh"]