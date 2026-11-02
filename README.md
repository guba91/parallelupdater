A little experiment.
This project aim to update with apt update and upgrade every host in your ssh config. 
It works with debian-based distro.
You need to provide the private key and the list of debian and ubuntu os or lxc container to update.
Then the script uses pssh and whiptail to ask you what to update.

## Setup
```
git clone https://github.com/guba91/parallelupdater
cd parallelupdater
cp .env.example .env    # set SSH_DIR (default ~/.ssh)
```
Every `Host` alias in `$SSH_DIR/config` (and its `Include` files) is a host to update;
wildcard patterns like `Host *` are skipped. Users, keys, ports, ProxyJump etc. are taken
from the ssh config, so that's the only place to edit. Hosts you never want to touch go
in `EXCLUDE` in `.env`. Aliases pointing to the same user@host:port are updated once.
Make sure your public key is on every host.

## Run
```
docker compose run --rm parallelupdater
```
(use `run`, not `up`: whiptail needs an interactive terminal)

The `data` volume keeps known_hosts (new hosts are accepted on first use, changed keys are refused),
the time of the last `apt update` and the last outputs.
Hosts that don't answer are listed separately instead of looking like "no updates".
