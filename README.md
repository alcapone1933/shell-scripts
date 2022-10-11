# Shell-Scripts
# Bash Script to Aautomate installation and Bash TOOLS

&nbsp;

## Automate installation

<details>
<summary markdown="span">Docker or Compose install</summary>

&nbsp;

Tested working on:

* :white_check_mark: Debian 11, Ubuntu 22

&nbsp;

### Docker and Compose install on DEBIAN
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-and-compose-debian-install.sh | suso bash
```

### Docker and Compose install on UBUNTU
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-and-compose-ubuntu-install.sh | suso bash
```

### Docker install on DEBIAN
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-debian-install.sh | suso bash
```

### Docker install on UBUNTU
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-ubuntu-install.sh | suso bash
```

### Compose install
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-compose-install.sh | suso bash
```
</details>

&nbsp;

## Bash TOOLS


<details>
<summary markdown="span">SSH Connect with Selection Menu from the SSH config</summary>

### SSH CONFIG DEMO
```txt
# ~/.ssh/config
# /home/user/.ssh/config
# /home/foo/.ssh/config
# /root/.ssh/config
Host demo-1
  HostName domain.com
  User foo
  Port 1111
  IdentityFile ~/.ssh/id_ed25519
Host demo-2
  HostName 10.10.10.10
  User root
  Port 22
  IdentityFile ~/.ssh/id_ed25519
Host demo-3
  HostName 1.1.1.1
  User foo
  Port 22
  IdentityFile ~/.ssh/id_ed25519
```

### Download
```bash
curl -sSL \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/tools/ssh-host-connect.sh \
> ~/ssh-host-connect.sh && chmod +x ~/ssh-host-connect.sh
```

### Usage
```txt
$ ./ssh-host-connect.sh

[ 1 ] - demo-1
[ 2 ] - demo-2
[ 3 ] - demo-3

Select a SSH HOST: _1_

$ ssh demo-1
```
</details>

&nbsp;
