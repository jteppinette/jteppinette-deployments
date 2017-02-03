# Deployments - *docker-compose and other resources to run jteppinette.com*

## Usage

### Required Software

* [docker](https://docs.docker.com/)

### Docker

Each application that requires a database needs to be initialized separately.

1. `$ docker-compose up -d --force-recreate`
2. `$ docker-compose logs db | grep "GENERATED` - get the db root password
3. `$ docker-compose exec db mysql -u root -p`  - enter the db root password
4. ` > CREATE DATABASE <db-name>;`
5. ` > GRANT ALL PRIVILEGES ON <db-name> . * TO 'db'@'%';`
6. ` > FLUSH PRIVILEGES;`
7. ` > exit`
