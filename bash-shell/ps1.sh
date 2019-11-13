#!/usr/bin/env bash
export PS1='\n\
[\[\e[32m\]\u\[\e[0m\]\
@\
\[\e[35m\]\h \
\[\e[36;1m\]\w\
\[\e[0m\]] \
$(RETVAL="$?"; echo -en "\e[33m{$(date +'%H:%M:%S')} ";
  if [ "$RETVAL" -eq 0 ];then
                echo -en "\[\e[32m\]($RETVAL)"
        else
                echo -en "\[\e[31;1m\a\]($RETVAL)"
  fi)\n\
\[\e[0;1;34m\]\$ \[\e[0m\]'
