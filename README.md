# README

## Software versions

- Ruby 3.1.1
- Rails 7.0.2

## Configuration

### Docker

- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/install/compose-plugin/#installing-compose-on-linux-systems)

#### Database setup

- DB creation

```docker
docker exec -it <container_ref> rails db:create
```

- DB migrations dev environment

```docker
docker exec -it <container_ref> rails db:migrate RAILS_ENV=development
```

#### Configuration for developers

- Install ruby (recommend to use a ruby version manager like [RVM](https://rvm.io/rvm/install))
- Inside Rails project run the command below to install the project gems

```bash
bundle install
```
