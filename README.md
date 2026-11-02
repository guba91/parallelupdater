A little experiment.
This project aim to update with apt update and upgrade every host listed in HOSTS in your .env. 
It works with debian-based distro.
You need to provide the private key and the list of debian and ubuntu os or lxc container to update.
Then the script uses pssh and whiptail to ask you what to update.

## Setup
```
git clone https://github.com/guba91/parallelupdater
cd parallelupdater
cp .env.example .env    # then put your hosts in HOSTS
```
Hosts are resolved through your `~/.ssh/config` (HostName, User, IdentityFile...), so `HOSTS`
can be just names. Use `name=ip` for hosts that are not in your ssh config.
Make sure your public key is on every host.

## Run
```
docker compose run --rm parallelupdater
```
(use `run`, not `up`: whiptail needs an interactive terminal)

The `data` volume keeps known_hosts (new hosts are accepted on first use, changed keys are refused),
the time of the last `apt update` and the last outputs.
Hosts that don't answer are listed separately instead of looking like "no updates".
