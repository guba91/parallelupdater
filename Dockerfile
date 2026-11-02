FROM debian:trixie-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends whiptail pssh openssh-client \
 && rm -rf /var/lib/apt/lists/*

COPY parallelupdater /app/parallelupdater
WORKDIR /app
VOLUME /data
ENTRYPOINT ["bash", "/app/parallelupdater"]
