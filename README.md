# Deployments - *docker-compose and other resources to run jteppinette.com*

## Applications

* [Professional Site](http://jteppinette.com) - [GitHub](http://github.com/jteppinette/professional-site)
* [Go JSON API Seed](http://go-json-api-seed.jteppinette.com) - [GitHub](http://github.com/jteppinette/go-json-api-seed)
* [AMP](http://amp.jteppinette.com) - [GitHub](http://github.com/jteppinette/amp)
* [Django API Seed](http://django-api-seed.jteppinette.com) - [GitHub](http://github.com/jteppinette/django-api-seed)
* [Angular Seed](http://angular-seed.jteppinette.com) - [GitHub](http://github.com/jteppinette/angular-seed)
* [Risk Managed](http://risk-managed.jteppinette.com) - [GitHub](http://github.com/jteppinette/risk-managed)
* [Peragrin API](http://api.peragrin.jteppinette.com) - [GitHub](http://github.com/jteppinette/peragrin-api)
* [Peragrin Client](http://app.peragrin.jteppinette.com) - [GitHub](http://github.com/jteppinette/peragrin-client)

## Development

1. remove the `jteppinette/` docker registry from each image in `docker-compose.yml`
2. create the images for each application listed above
3. follow the steps in `Docker and DB Initialization`

## Usage

### Required Software

* [docker](https://docs.docker.com/)

### Prepare

1. update the secrets in `.env`
2. update the `VIRTUAL_HOSTS` in `docker-compose.yml` to reflect the `server_name`

### Docker and DB Initialization

* repeat steps 4 & 5 for each `DB_NAME` listed in the `docker-compose.yml` file.

1. `$ docker-compose up -d --force-recreate`
2. `$ docker-compose logs db | grep "GENERATED` - get the db root password
3. `$ docker-compose exec db mysql -u root -p`  - enter the db root password
4. ` > CREATE DATABASE <db-name>;`
5. ` > GRANT ALL PRIVILEGES ON <db-name> . * TO 'db'@'%';`
6. ` > FLUSH PRIVILEGES;`
7. ` > exit`

## TODO:

1. add `SESSION_SECRET` to the `.env` file
