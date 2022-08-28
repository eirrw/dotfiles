# dirs
alias d="dirs -v"
for index ({1..9}) alias "$index"="cd +${index}"; unset index # directory stack

# ls
alias ls="ls --color=auto"
alias la="ls -la"
alias ll="ls -l"

# ssh
alias s="ssh"

# command replacements
[[ -x "$(command -v exa)" ]] && alias ls=exa
[[ -x "$(command -v rg)" ]] && alias grep=rg
[[ -x "$(command -v rsync)" ]] && \
    alias cp='rsync -ahPHAXSb --backup-dir=/tmp/rsync -e /dev/null'
[[ -x "$(command -v podman)" ]] && alias docker=podman
