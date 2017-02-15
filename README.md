# Deployments - *docker-compose and other resources to run jteppinette.com*

## Applications

* [Professional Site](http://jteppinette.com) - [GitHub](http://github.com/jteppinette/professional-site)
* [Go JSON API Seed](http://go-json-api-seed.jteppinette.com) - [GitHub](http://github.com/jteppinette/go-json-api-seed)
* [AMP](http://amp.jteppinette.com) - [GitHub](http://github.com/jteppinette/amp)
* [Django API Seed](http://django-api-seed.jteppinette.com) - [GitHub](http://github.com/jteppinette/django-api-seed)
* [Angular Seed](http://angular-seed.jteppinette.com) - [GitHub](http://github.com/jteppinette/angular-seed)
* [Risk Managed](http://risk-managed.jteppinette.com) - [GitHub](http://github.com/jteppinette/risk-managed)
* [Water Dragon API](http://api.water-dragon.jteppinette.com) - [GitHub](http://github.com/jteppinette/water-dragon-api)
* [Peragrin API](http://api.peragrin.jteppinette.com) - [GitHub](http://github.com/jteppinette/peragrin-api)
* [Peragrin Client](http://app.peragrin.jteppinette.com) - [GitHub](http://github.com/jteppinette/peragrin-client)

## Development

1. `clone <repo-url>` - for each app listed above
1. `docker build -t <app> <app-dir>` - for each app listed above
2. `docker-compose -f development.yml up -d --force-recreate`
3. follow the steps in `Docker and DB Initialization`

## Usage

### Required Software

* [docker](https://docs.docker.com/)

### Docker Compose

1. update the secrets in `.env`
2. `docker-compose -f production.yml up -d --force-recreate`

### Database Initialization

* Repeat steps 4 & 5 for each `DB_NAME` listed in the `production.yml` file.
* Notice, some apps use MySQL and others use PostgreSQL. This information can be found in the links section of each service definition.

#### MySQL

1. `$ docker-compose -f production.yml logs mysql | grep "GENERATED` - get the db root password
2. `$ docker-compose -f production.yml exec mysql mysql -u root -p`  - enter the db root password
3. ` > CREATE DATABASE <db-name>;`
4. ` > GRANT ALL PRIVILEGES ON <db-name> . * TO 'db'@'%';`
5. ` > FLUSH PRIVILEGES;`
6. ` > exit`

#### PostgreSQL

1. `$ docker-compose -f production.yml exec postgresql psql -U postgres`
2. ` > CREATE DATABASE <db-name> OWNER db;`
5. ` > \q`
