FROM debian:latest

RUN apt update && apt upgrade -y && apt install whiptail pssh openssh-client expect dialog -y && rm -rf /var/lib/apt/lists/*
RUN mkdir /app
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

COPY parallelupdater /app/parallelupdater

WORKDIR /app
CMD ["bash", "parallelupdater"]
