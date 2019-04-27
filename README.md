# ldenv
Linux development environment

This Repository is used for some linux/unix or macOS to be better start.

Something maybe not work, you must detect carefully.

## Content List
- [PS1](#ps1)
- [Git(git-completion、bash-git-prompt)](#git)
- Nginx
- Dockerfile
    - [Append Bash Alias](https://github.com/tkstorm/ldenv/tree/master/docker) 
- HTTPS

### PS1
```
sudo wget https://raw.githubusercontent.com/tkstorm/ldenv/master/ps1.sh -O /etc/profile.d/ps1.sh
```

### GIT 
- git-completion

```
sudo cp /usr/local/src/git-2.18.0/contrib/completion/git-completion.bash /etc/profile.d/git-completion.sh
```

- bash-git-prompt
```
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Add to the ~/.bashrc:
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
```

## Docker

### Container Alias
```
// wget alias.sh
wget https://raw.githubusercontent.com/tkstorm/ldenv/master/docker/alias.sh
// cp to /etc/profile.d/ in Dockerfile
COPY ./alias.sh /etc/profile.d/
// using a login shell
docker exec -it database_mysql_1 /bin/bash -l
```

## HTTPS
Something about CA openssl.cnf config file.

more info see : https://tkstorm.com/openssl-usages
