alias la="ls -la"
alias ll="ls -l"

alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gsw="git switch"

alias s="ssh"

[[ -x "$(command -v exa)" ]] && alias ls=exa
[[ -x "$(command -v rg)" ]] && alias grep=rg
[[ -x "$(command -v rsync)" ]] && \
    alias cp='rsync -ahPHAXSb --backup-dir=/tmp/rsync -e /dev/null'
