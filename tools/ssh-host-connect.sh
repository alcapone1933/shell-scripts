#!/bin/bash
# "grep -P \"^Host ([^*]+)$\" $HOME/.ssh/config | sed 's/Host //'"
# SSH_HOSTS=$(grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //')
SSH_HOSTS=$(grep -P "^Host ([^*]+)$" ~/.ssh/config | sed 's/Host //')
i=1
for hosts in $SSH_HOSTS; do
  echo "[ ${i} ] - ${hosts}"
  SSH_HOST[${i}]="${hosts}"
  ((i++))
done
echo
input_sel=0
while [[ ${input_sel} -lt 1 ||  ${input_sel} -gt ${i} ]]; do
  read -p " Select a SSH HOST: " input_sel
done
SSH_HOST_POINT="${SSH_HOST[${input_sel}]}"
ssh $SSH_HOST_POINT