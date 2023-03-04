# escape=`
FROM ubuntu:22.10
LABEL "Author"="cryonim"

FROM python:3.11.1

RUN apt-get update
RUN apt-get upgrade -y

RUN pip install ansible
RUN pip install argcomplete
RUN apt-get install -y nano
RUN pip install -Iv 'resolvelib<0.6.0'
RUN ansible-galaxy collection install linode.cloud
RUN ansible-galaxy collection install community.general
RUN pip install -r ~/.ansible/collections/ansible_collections/linode/cloud/requirements.txt
RUN apt-get install -y sshpass
RUN apt-get update
RUN apt-get upgrade -y

RUN mkdir ~/development
RUN mkdir -p ~/development/group_vars/
RUN touch ~/development/group_vars/vars.yml

RUN mkdir -p /etc/ansible/
COPY ["../.vault-pass", "/root/development/"]
COPY ["../ansible.cfg", "/etc/ansible/"]
COPY ["../deploylinode.yml", "/root/development/"]
COPY ["../valheim-ansible-conf.sh", "/root/development/"]
COPY ["../linodeconf.yml", "/root/development/"]
COPY ["../Valheim/.env", "/root/development/"]
RUN chmod 644 ~/development/.vault-pass
RUN chmod 777 /etc/ansible//ansible.cfg
RUN chmod 644 ~/development/deploylinode.yml
RUN chmod 777 ~/development/valheim-ansible-conf.sh
RUN chmod 644 ~/development/linodeconf.yml
RUN chmod 644 ~/development/.env

RUN touch ~/development/custom_inventory.ini
RUN chmod 777 ~/development/custom_inventory.ini


ENTRYPOINT ["/root/development/valheim-ansible-conf.sh"]