#!/bin/sh
ansible-vault encrypt_string $ROOT_PS --name 'password' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

ansible-vault encrypt_string $Linode_API --name 'api_token' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

ansible-vault encrypt_string $BKP_LOC --name 'BKP_LOC' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

echo "remote_pass = $ROOT_PS" >> /etc/ansible/ansible.cfg
echo "" >> /etc/ansible/ansible.cfg

ansible-playbook -i /root/development/custom_inventory.ini ~/development/deploylinode.yml  --vault-password-file /root/development/.vault-pass

#sleep 120

#echo 'yes' | ansible-playbook -i /root/development/custom_inventory.ini -c /root/development/ansible.cfg ~/development/linodeconf.yml --vault-password-file /root/development/.vault-pass -vvv > ~/development/result.txt
#using default config file location
ansible-playbook -i /root/development/custom_inventory.ini ~/development/linodeconf.yml --vault-password-file /root/development/.vault-pass 
