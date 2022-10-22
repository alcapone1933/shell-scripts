#!/bin/bash
#
if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit 1
fi

if [ -f "/usr/bin/whiptail" ]; then
    echo > /dev/null
else
    echo
    echo " Whiptail not installed"
    echo " Install Whiptail"
    echo " ==> sudo apt update && sudo apt install whiptail <== "
    echo
    echo
    echo " DO you want to install Whiptail for Debian / Mint / Ubuntu"
    echo "========================================="
    echo "[ Y ] - INSTALL WHIPTAIL"
    echo "[ N ] - EXIT"
    echo "========================================="
    echo
    read -n 1 -t 60 -p 'Enter your answer value: ' value_whiptail;
    if [[ "$value_whiptail" =~ (y|Y) ]]; then
        sudo apt update && apt install whiptail -yq
    else
        echo
        exit 1
    fi
fi
function Docker_and_Compose_install_on_DEBIAN() {
    if whiptail --yesno "Docker and Compose install on DEBIAN" 10 100; then
        wget -q -O - https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-and-compose-debian-install.sh | sudo bash
        whiptail --title "Docker Version" --no-button ok  --msgbox "`docker -v`   |   `docker-compose version`" 15 80
    else
        clear
        return 0
    fi
}
function Docker_and_Compose_install_on_UBUNTU() {
    if whiptail --yesno "Docker and Compose install on UBUNTU" 10 100; then
        wget -q -O - https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-and-compose-ubuntu-install.sh | sudo bash
        whiptail --title "Docker Version" --no-button ok  --msgbox "`docker -v`   |   `docker-compose version`" 15 80
    else
        clear
        return 0
    fi
}
function Docker_install_on_DEBIAN() {
    if whiptail --yesno "Docker install on DEBIAN" 10 100; then
        wget -q -O - https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-debian-install.sh | sudo bash
        whiptail --title "Docker Version" --no-button ok  --msgbox "`docker -v`" 8 42
    else
        clear
        return 0
    fi
}
function Docker_install_on_UBUNTU() {
    if whiptail --yesno "Docker install on UBUNTU" 10 100; then
        wget -q -O - https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-ubuntu-install.sh | sudo bash
        whiptail --title "Docker Version" --no-button ok  --msgbox "`docker -v`" 8 42
    else
        clear
        return 0
    fi
}
function Docker_Compose_install() {
    if whiptail --yesno "Docker Compose install" 10 100; then
        wget -q -O - https://raw.githubusercontent.com/alcapone1933/shell-scripts/master/install/docker-compose-install.sh | sudo bash
        whiptail --title "Docker Version" --no-button ok  --msgbox "`docker-compose version`" 8 34
    else
        clear
        return 0
    fi
}
function Docker_and_Compose_remove() {
    if whiptail --yesno "Docker and Compose Remove" 10 100; then
        sudo apt-get remove --purge docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
        sudo apt-get autoremove -y
        rm -vrf /usr/local/bin/docker-compose && rm -vrf /usr/bin/docker-compose
        clear
    else
        clear
        return 0
    fi
}
function Docker_remove() {
    if whiptail --yesno "Docker Remove" 10 100; then
        sudo apt-get remove --purge docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
        sudo apt-get autoremove -y
        clear
    else
        clear
        return 0
    fi
}
function Docker_Compose_remove() {
    if whiptail --yesno "Docker Compose Remove" 10 100; then
        rm -vrf /usr/local/bin/docker-compose && rm -vrf /usr/bin/docker-compose
        clear
    else
        clear
        return 0
    fi
}
function CLEAN() {
while [ true ];
do
CHOICE=$(
whiptail --title "DOCKER RESTORE MENU" --menu "Choose an option" 18 100 10 \
    "[ 1 ]" "Docker and Compose Remove" \
    "[ 2 ]" "Docker Remove" \
    "[ 3 ]" "Docker Compose Remove" \
    "[ R ]" "Return to Start Menu" \
    "[ E ]" "EXIT"  3>&1 1>&2 2>&3
)
    # usage;
    case $CHOICE in
        "[ 1 ]")
            Docker_and_Compose_remove
            ;;
        "[ 2 ]")
            Docker_remove
            ;;
        "[ 3 ]")
            Docker_Compose_remove
            ;;
        "[ R ]")
            return 0
            ;;
        "[ E ]")
            EXIT
            clear
            exit 1
            ;;
        *)
            clear
            exit 1
            ;;
    esac
done
}
function EXIT() {
EXIT=$(
echo "========================================="
echo "================= EXIT =================="
echo "========================================="
)
    # whiptail --msgbox "$EXIT" 11 45
    TERM=ansi whiptail --title "EXIT" --infobox "$EXIT" 11 45
    sleep 2
    clear
    return 1
}
while [ true ];
do
CHOICE=$(
whiptail --title "DOCKER RESTORE MENU" --menu "Choose an option" 18 100 10 \
    "[ 1 ]" "Docker and Compose install on DEBIAN" \
    "[ 2 ]" "Docker and Compose install on UBUNTU" \
    "[ 3 ]" "Docker install on DEBIAN" \
    "[ 4 ]" "Docker install on UBUNTU" \
    "[ 5 ]" "Docker Compose install" \
    "[ 6 ]" "Remove Docker or Docker Compose" \
    "[ E ]" "EXIT"  3>&1 1>&2 2>&3
)
    # usage;
    case $CHOICE in
        "[ 1 ]")
            Docker_and_Compose_install_on_DEBIAN
            ;;
        "[ 2 ]")
            Docker_and_Compose_install_on_UBUNTU
            ;;
        "[ 3 ]")
            Docker_install_on_DEBIAN
            ;;
        "[ 4 ]")
            Docker_install_on_UBUNTU
            ;;
        "[ 5 ]")
            Docker_Compose_install
            ;;
        "[ 6 ]")
            CLEAN
            ;;
        "[ E ]")
            EXIT
            clear
            exit 1
            ;;
        *)
            clear
            break
            ;;
    esac
done
