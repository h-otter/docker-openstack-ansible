FROM ubuntu:latest

MAINTAINER h-otter <h-otter@outlook.jp>

ARG OPENSTACK_VERSION="15.1.5"
ARG VAULT_PASS
ENV ANSIBLE_VAULT_PASSWORD_FILE /root/.vault_pass

RUN apt update \
    && apt install -y \
        git \
        openssh-client \
        rsync \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN git clone -b ${OPENSTACK_VERSION} https://git.openstack.org/openstack/openstack-ansible /opt/openstack-ansible \
    && /opt/openstack-ansible/scripts/bootstrap-ansible.sh \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /etc/openstack_deploy
ADD etc /etc/openstack_deploy/
ADD ./certs/id_ecdsa /root/.ssh/id_ecdsa

WORKDIR /opt/openstack-ansible/playbooks
RUN echo ${VAULT_PASS} > $ANSIBLE_VAULT_PASSWORD_FILE
CMD ["openstack-ansible", "setup-infrastructure.yml", "--syntax-check"]
