


```
$ docker build ./ --build-arg VAULT_PASS=hoge
$ docker run
```

## setup secret

```
# cd /opt/openstack-ansible/scripts
# python pw-token-gen.py --file /etc/openstack_deploy/user_secrets.yml
# ansible-vault encrypt /etc/openstack_deploy/user_secrets.yml
```
