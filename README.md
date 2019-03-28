# ldenv
linux development environment

## Content List
- PS1 
- GIT (git-completion、bash-git-prompt)

### PS1
```

```

### git
- git-completion
```
sudo cp /usr/local/src/git-2.18.0/contrib/completion/git-completion.bash /etc/profile.d/git-completion.sh
```

- bash-git-prompt
```
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
#Add to the ~/.bashrc:
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
```
