# Shell-Scripts
# Bash Script to Automate installation and Bash TOOLS

&nbsp;

## Automate installation with Whiptail

Tested working on:

* :white_check_mark: Debian 11, Ubuntu 22

&nbsp;

Installing Whiptail

```bash
sudo apt install whiptail -y
```
Run the script and click through the Menu

```bash
wget -q -O - https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install.sh | sudo bash

```

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
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-and-compose-debian-install.sh | sudo bash
```

### Docker and Compose install on UBUNTU
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-and-compose-ubuntu-install.sh | sudo bash
```

### Docker install on DEBIAN
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-debian-install.sh | sudo bash
```

### Docker install on UBUNTU
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-ubuntu-install.sh | sudo bash
```

### Docker Compose install
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-compose-install.sh | sudo bash
```
</details>

<details>
<summary markdown="span">Shoutrrr cli install</summary>

&nbsp;

Tested working on:

* :white_check_mark: Debian 11
* Supported platforms for the Script:
  - linux/386
  - linux/amd64
  - linux/arm
  - linux/arm64v8

&nbsp;

### Shoutrrr cli install
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/shoutrrr-cli-install.sh | sudo bash -s -- --install
```

### Shoutrrr cli update
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/shoutrrr-cli-install.sh | sudo bash -s -- --update
```
### Shoutrrr cli remove
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/shoutrrr-cli-install.sh | sudo bash -s -- --remove
```
### Shoutrrr cli manuel download
```bash
wget -q -O shoutrrr-cli-install.sh \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/shoutrrr-cli-install.sh

chmod +x shoutrrr-cli-install.sh

./shoutrrr-cli-install.sh
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
