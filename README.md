# dev-config
针对开发环境中的一些配置，主要是针对Linux环境相关！

## Content List
- [常用Bash Tips](https://tkstorm.com/posts-list/os/linux/bashshell-tips/)
- [配置PS1](#ps1)
- [Git-Prompt](#git)
- [代理源配置](./proxy-source)
- Docker Bash Alias
- 自签名证书:  https://tkstorm.com/openssl-usages 
- Nginx相关

### PS1
```
sudo wget https://raw.githubusercontent.com/tkstorm/dev-config/master/bash-shell/ps1.sh -O /etc/profile.d/ps1.sh
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

#### Docker Container Alias
```
// wget alias.sh
wget https://raw.githubusercontent.com/tkstorm/dev-config/master/docker/alias.sh
// cp to /etc/profile.d/ in Dockerfile
COPY ./alias.sh /etc/profile.d/
// using a login shell
docker exec -it database_mysql_1 /bin/bash -l
```

### Proxy-Source
[代理源配置](./proxy-source)