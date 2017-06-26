# openstack-ansible on docker

- image size is about 650MB
- for example [da25aed](https://github.com/h-otter/docker-openstack-ansible/tree/da25aed66ae6870916291bacc5fcfbaffe9c8639)

## build and launch

```
$ docker build --build-arg VAULT_PASS=hoge -t openstack-ansible:15.1.5 .
$ docker run -v `pwd`/etc/:/etc/openstack_deploy openstack-ansible:15.1.5
Variable files: "-e @/etc/openstack_deploy/user_secrets.yml -e @/etc/openstack_deploy/user_variables.yml "
[DEPRECATION WARNING]: docker is kept for backwards compatibility but usage is discouraged. The module documentation details page may explain
 more about this rationale..
This feature will be removed in a future release. Deprecation warnings can be disabled by setting
deprecation_warnings=False in ansible.cfg.

playbook: setup-infrastructure.yml
```

## setup or initialize secret 

```
# cp /opt/openstack-ansible/etc/openstack_deploy/user_secrets.yml /etc/openstack_deploy/
# cd /opt/openstack-ansible/scripts
# python pw-token-gen.py --file /etc/openstack_deploy/user_secrets.yml
# ansible-vault encrypt /etc/openstack_deploy/user_secrets.yml
```

### on the docker host

```
# chown user:root etc/user_secrets.yml
```

## LICENSE

MIT