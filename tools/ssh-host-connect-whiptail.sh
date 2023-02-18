#!/bin/bash
# "grep -P \"^Host ([^*]+)$\" $HOME/.ssh/config | sed 's/Host //'"
# SSH_HOSTS=$(grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //')
SSH_HOSTS=$(grep -P "^Host ([^*]+)$" ~/.ssh/config | sed 's/Host //')
i=1
LIST_SSH_HOSTS=$(
for hosts in $SSH_HOSTS; do
    echo "[ ${i} ] - ${hosts}"
    ((i++))
done
)
for hosts in $SSH_HOSTS; do
    SSH_HOST[${i}]="${hosts}"
    ((i++))
done
echo
input_sel=0
while [[ ${input_sel} -lt 1 ||  ${input_sel} -gt ${i} ]]; do
    echo
    if [ $# -lt 1 ]; then
        input_sel=$(whiptail --title "ssh config" --inputbox "$LIST_SSH_HOSTS" 45 110 3>&1 1>&2 2>&3)
        clear
    else
        export input_sel="$1"
        clear
    fi
    # read -p " Select a SSH HOST: " input_sel
    echo "$input_sel"
    if [ -z "$input_sel" ]; then
        clear
        exit 0
    else
        echo "$input_sel"
        clear
    fi
done
SSH_HOST_POINT="${SSH_HOST[${input_sel}]}"
ssh $SSH_HOST_POINT
