# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# programmable bash completion.
#if [[ -f /etc/bash_completion ]]; then
#    . /etc/bash_completion
#    _expand() { :; } # disable tilde expansion.
#fi
#if [[ -d /etc/bash_completion.d/ ]]; then
#   . /etc/bash_completion.d/yum-utils.bash
#fi
PATH=$PATH:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/userscripts:/bin:/opt/admin/OPS/etc:/opt/admin/synctool/files:/opt/OV/bin:/opt/perf/bin:/sbin
export PATH
Green='\[\033[0;32m\]'
Yellow='\[\033[0;33m\]'
NOC='\[\033[0m\]'

if [[ `uname -s` == SunOS ]]
then
#    PS1="$(hostname | awk -F. '{print $1}')|${Green} Solaris ${NOC}| $(who am i | awk '{print $2}') $ "
    PS1="$(hostname | awk -F. '{print $1}')|${Green} Solaris ${NOC}|$(tty | cut -d/ -f3,4) $ "
else
    PS1="$(hostname | awk -F. '{print $1}')|${Yellow} Linux ${NOC}| $(tty | cut -d/ -f3,4) $ "
    PS1="\u@\h:${Green}L${NOC}:$(tty | cut -d/ -f3,4) \w $ "
fi

export PATH PS1


# History Options
#
#HISTORY new file
export HISTFILE=~/.bash_eternal_history
# Don't put duplicate lines in the history.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions.
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
#HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well.
#
# Whenever displaying the prompt, write the previous line to disk.
PROMPT_COMMAND="history -a; history -n"
#HISTSIZE=262144 #65536 * 4 = 262144
HISTSIZE=
#HISTFILESIZE=524288 #65536 * 8 = 524288
HISTFILESIZE=
# don't put duplicate lines in the history. See bash(1) for more options.
# ... or force ignoredups and ignorespace.
HISTCONTROL=ignoredups:ignorespace
#
# append to the history file, don't overwrite it.
shopt -s histappend
# save multi-lined commands in the same history entry.
shopt -s cmdhist
#
# write timestamp to $HISTFILE.
export HISTTIMEFORMAT='%F %T '
if [[ $(uname -s) == Linux ]]
then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
