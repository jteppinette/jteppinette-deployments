# Deployments - *terraform resources and ansible scripts to create jteppinette.com*

## Applications

* [Professional Site](http://jteppinette.com) - [GitHub](https://gitlab.com/jteppinette/professional-site)
* [Go JSON API Seed](http://go-json-api-seed.jteppinette.com) - [GitHub](https://gitlab.com/jteppinette/go-json-api-seed)
* [AMP](http://amp.jteppinette.com) - [GitHub](https://gitlab.com/jteppinette/amp)
* [Django API Seed](http://django-api-seed.jteppinette.com) - [GitHub](https://gitlab.com/jteppinette/django-api-seed)
* [Angular Seed](http://angular-seed.jteppinette.com) - [GitHub](http://github.com/jteppinette/angular-seed)
* [Risk Managed](http://risk-managed.jteppinette.com) - [GitHub](https://gitlab.com/jteppinette/risk-managed)
* [Water Dragon API](http://api.water-dragon.jteppinette.com) - [GitHub](https://gitlab.com/jteppinette/water-dragon-api)

## Use

```
$ git clone <repo-url> deployments && cd deployments
$ export WORKDIR=`pwd`
$ export DO_API_TOKEN=<digital-ocean-pat>
$ export SSH_FINGERPRINT=<md5-fingerprint> # This can be received with `ssh-keygen -lf <id_rsa-path> -E md5` and taking the fingerprint portion.
$ cd terraform
$ terraform plan -var "do_api_token=${DO_API_TOKEN}" -var "ssh_fingerprint=${SSH_FINGERPRINT}"
$ terraform apply -var "do_api_token=${DO_API_TOKEN}" -var "ssh_fingerprint=${SSH_FINGERPRINT}"
$ cd ${WORKDIR}
$ ansible-playbook -u root -i digitalocean.py -e "REGISTRY_PASSWORD=<gitlab-registry-password>" docker.yml      # Install Docker CE on each host.
$ ansible-playbook -u root -i digitalocean.py swarm.yml                                                         # Connect the nodes to a "manager/worker" Swarm cluster.
$ ansible-playbook -u root -i digitalocean.py stack.yml                                                         # Upload the Stack file and necessary config files, start the services.
$ ansible-playbook -u root -i digitalocean.py initialize.yml                                                    # Initialize database migrations and create fixture data.
```
