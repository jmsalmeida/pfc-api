# README
#### Software versions
- Ruby 3.1.1
- Rails 7.0.2

## Configuration
#### Docker
###### Links
- [Docker](https://docs.docker.com/install/)

###### Run MySQL Container
```
docker pull mysql
```
```
docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -d mysql
```

###### Database creation
```
rails db:create
```