A little experiment.
This project aim to update with apt update and upgrade every host you specify in the extra_hosts section. 
It works with debian-based distro.
You need to provide the private key and the list of debian and ubuntu os or lxc container to update.
Then the script uses pssh and whiptail to ask you what to update.

to build:
```docker build -t parallelupdater:0.1 .  ```

to run:
```
docker run -it -v ./id_rsa:/root/.ssh/id_rsa --add-host host2:192.168.5.2 parallelupdater:0.1
```


Example usage:
```git clone https://github.com/guba91/parallelupdater```
Populate "myhosts" with standard hosts syntax:
```
#ip hostname
192.168.5.10 testvm
192.168.5.11 testlxc
```
Be sure to have your public key on every host you plan to update

```docker run -it --mount type=bind,source="$(pwd)/.ssh/id_rsa",target=/root/.ssh/id_rsa  -v ./my_hosts:/root/my_hosts parallelupdater:0.1```

Be sure to change the file path in "$(pwd)/.ssh/id_rsa" with the path of your private key
