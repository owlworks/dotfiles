alias grep='grep --color'
alias hg='history | grep'
alias pg='ps auwx | grep'
alias ll='ls -la'
alias gg='git grep'
alias g='git'
alias tf='tail -F'
export HISTSIZE=10000
export HISTFILESIZE=100000
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export TERM=xterm-color

function cdls() {
    \cd $1;
    ls;
}
alias cd=cdls

# Prompt Settings
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/' -e 's/\[//' -e 's/\]//'
}
function promps {
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[0;40m\]"
    local  GRAY="\[\e[1;37m\]"
    local  BR="\[\e[30;45m\]"
    local  BG="\[\e[30;42m\]"
    local  BL="\[\e[30;47m\]"
    local  BB="\[\e[30;44m\]"
    local  DEF="\[\e[37;40;00m\]"
    PS1="\n${BR}\t ${BG} \h ${BL} \w ${BB} \$(parse_git_branch) ${DEF}\n${RED}( ᐛ )ﻭ < ${DEF}"
}
promps
