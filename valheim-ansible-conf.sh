#!/bin/sh
echo "Starting to store env vars in the vault"
echo "The root ps is $ROOT_PS"

ansible-vault encrypt_string $ROOT_PS --name 'password' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

ansible-vault encrypt_string $Linode_API --name 'api_token' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
echo "" >> /root/development/group_vars/vars.yml

#if bkp loc exists, use if [[! -v BKP_LOC ]]; for if not
if [[ -v BKP_LOC ]]; then ansible-vault encrypt_string $BKP_LOC --name 'BKP_LOC' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml; fi
echo "" >> /root/development/group_vars/vars.yml

echo "remote_pass = $ROOT_PS" >> /etc/ansible/ansible.cfg
echo "" >> /etc/ansible/ansible.cfg

echo "Ansible Vault Created"

cat /root/development/group_vars/vars.yml
echo "Catted"


ansible-playbook -i /root/development/custom_inventory.ini ~/development/deploylinode.yml  --vault-password-file /root/development/.vault-pass

echo "Playbook 1 finished"

#sleep 120

#echo 'yes' | ansible-playbook -i /root/development/custom_inventory.ini -c /root/development/ansible.cfg ~/development/linodeconf.yml --vault-password-file /root/development/.vault-pass -vvv > ~/development/result.txt
#using default config file location
ansible-playbook -i /root/development/custom_inventory.ini ~/development/linodeconf.yml --vault-password-file /root/development/.vault-pass




echo "All Playbooks finished"
