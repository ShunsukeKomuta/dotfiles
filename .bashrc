#-------------Visuals--------------#
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8
case ${UID} in
0)
     LANG=C
     ;;
esac

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

#-------------Prompt-------------#
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export HISTTIMEFORMAT='%t%F %T%t'
export HISTSIZE=20000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth          #ignoreboth(ignoredups,ignorespace),erasedups
export HISTIGNORE=?:??:???:exit

#-------------Aliases-------------#
# alias where="command -v"
# alias j="jobs -l"
# alias du="du -h"
# alias df="df -h"
# alias su="su -l"
alias ftxg="find . -type f 2> /dev/null | xargs grep -n --color"
alias vaprobash="curl -L http://bit.ly/vaprobash > Vagrantfile"
alias vim="mvim -v"
alias vi="mvim -v"

#-------------evals-------------#
eval $(docker-machine env default)
