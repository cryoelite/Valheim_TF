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
COPY ["../setup.sh", "/root/development/"]
COPY ["../linodeconf.yml", "/root/development/"]
RUN chmod 644 ~/development/.vault-pass
RUN chmod 777 /etc/ansible//ansible.cfg
RUN chmod 644 ~/development/deploylinode.yml
RUN chmod 777 ~/development/valheim-ansible-conf.sh
RUN chmod 777 ~/development/setup.sh
RUN chmod 644 ~/development/linodeconf.yml

ARG ROOT_PS
ARG Linode_API
ARG SERVER_PS

#RUN ansible-vault encrypt_string "${ROOT_PS}" --name 'password' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
#RUN echo "" >> /root/development/group_vars/vars.yml

#RUN ansible-vault encrypt_string "${Linode_API}" --name 'api_token' --vault-password-file /root/development/.vault-pass | tee -a ~/development/group_vars/vars.yml
#RUN echo "" >> /root/development/group_vars/vars.yml

RUN touch ~/development/result.txt
RUN touch ~/development/custom_inventory.ini
RUN chmod 777 ~/development/custom_inventory.ini
#RUN ansible-playbook ~/development/deploylinode.yml --vault-password-file /root/development/.vault-pass > ~/development/result.txt

#Can't use RUN, they run the commands on image build time, we wish to run these on container built time.

#RUN cat /root/development/result.txt
ENV ROOT_PS ${ROOT_PS}
ENV Linode_API ${Linode_API}
ENV SERVER_PS ${SERVER_PS}


ENTRYPOINT ["/root/development/valheim-ansible-conf.sh"]
CMD ["exec", "/bin/sh"]