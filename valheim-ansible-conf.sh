#!/bin/sh
ansible-vault encrypt_string $ROOT_PS --name 'password' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

ansible-vault encrypt_string $Linode_API --name 'api_token' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

ansible-playbook ~/development/deploylinode.yml --vault-password-file /root/development/.vault-pass > ~/development/result.txt

cat /root/development/result.txt