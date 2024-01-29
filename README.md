a little experiment

```
docker run -it -v ./id_rsa:/root/.ssh/id_rsa --add-host host2:192.168.5.2 parallelupdater:0.1
```
 or with compose:
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
