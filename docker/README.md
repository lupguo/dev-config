## How to use

Let's create a mysql docker image.

### Download alias.sh

```
wget https://raw.githubusercontent.com/tkstorm/ldenv/master/docker/alias.sh
```

### Create Dockerfile PATH
```
$ cat Dockerfile
FROM mysql:8.0

WORKDIR /etc/mysql

COPY ./alias.sh /etc/profile.d/
```

### Create docker-compose.yml
```
version: "3"
services:
    mysql:
        build: .
        ports:
            - 3306:3306
        volumes:
            - /var/lib/mysql-data/:/var/lib/mysql-data/
        environment:
            MYSQL_ROOT_PASSWORD: "YOUR_PASSWORD"
``` 

### Build and run docker-compose
```
docker-compose up -d

# force Compose to stop and recreate all containers
# docker-compose up --build --force-recreate -d
```

### Go into container

Because all `*.sh` file `/etc/profile.d/` will be source in a login bash, so you should apend a `-l`: `/bin/bash -l`

```
$ docker-compose exec mysql /bin/bash -l
root@55e9fee57c6d:/etc/mysql# alias
alias cp='cp -i'
alias grep='grep --color'
alias l='ls --color -lA'
alias ll='ls --color -l'
alias ls='ls --color'
alias mv='mv -i'
alias rm='rm -i'
```
