A little experiment.
This project aim to update with apt update and upgrade every host you specify in the extra_hosts section. It works with debian-based distro.
You need to provide the private key and the list of debian and ubuntu os or lxc container to update.
Then the script uses parallel-ssh and whiptail to ask you what to update.

to build:
```docker build -t parallelupdater:0.1 .```

to run:
```
docker run -it -v ./id_rsa:/root/.ssh/id_rsa --add-host host2:192.168.5.2 parallelupdater:0.1
```
 or with compose: (but doesn't work with compose.. don't show whiptail)
```
version: "3.8"
services:
  parallelupdater:
    container_name: parallelupdater
    image: parallelupdater:0.1
    restart: unless-stopped
    extra_hosts:
      host2: 192.168.5.2
      host3: 192.168.5.3
      host4: 192.168.5.4
    tty: true
    stdin_open: true
    environment:
      - TERM=xterm
    volumes:
      - ./id_rsa:/root/.ssh/id_rsa
```
