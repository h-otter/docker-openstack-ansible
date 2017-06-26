# openstack-ansible on docker

- image size is about 650MB

## build and launch

```
$ docker build --build-arg VAULT_PASS=hoge -t openstack-ansible:15.1.5 .
$ docker run -v `pwd`/etc/:/etc/openstack_deploy openstack-ansible:15.1.5

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