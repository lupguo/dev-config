# ldenv
Linux development environment

This Repository is used for some linux/unix or macOS to be better start.

Something maybe not work, you must detect carefully.

## Content List
- [PS1](#ps1)
- [GIT(git-completion、bash-git-prompt)](#git)

### PS1
```
wget https://raw.githubusercontent.com/tkstorm/ldenv/master/ps1.sh -O /etc/profile.d/ps1.sh
```

### git
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
