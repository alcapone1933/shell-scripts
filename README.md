# Shell-Scripts
## Bash Script to Aautomate installation and Bash TOOLS
Tested working on:

* :white_check_mark: Debian 11
## Automate installation
### Docker and Compose install
Docker and Compose install
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/docker/docker-and-compose-install.sh | bash
```
Docker install
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/docker/docker-install.sh | bash
```
 Compose install
```bash
wget -q -O - \
https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/docker/docker-compose-install.sh | bash
```
## Bash TOOLS

SSH MENU \
SSH Connect with Selection Menu from the SSH config
```bash
#

curl -sSL \
https://raw.githubusercontent.com/alcapone1933/docker-vackup/master/scripts/docker-volume-backup-all.sh \
> ~/ssh-host-connect.sh && chmod +x ~/ssh-host-connect.sh
```
