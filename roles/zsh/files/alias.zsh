# dirs
alias d="dirs -v"
for index ({1..9}) alias "$index"="cd +${index}"; unset index # directory stack

# ls
exa_opts=""
ls_cmd=ls
if [ -x "$(command -v exa)" ]; then
    ls_cmd=exa
    exa_opts="--git --icons"
fi

alias ls="${ls_cmd} --color=auto ${exa_opts}"
alias la="${ls_cmd} -la ${exa_opts}"
alias ll="${ls_cmd} -l ${exa_opts}"

# ssh
alias s="ssh"

# command replacements
[[ -x "$(command -v rg)" ]] && alias grep=rg
[[ -x "$(command -v rsync)" ]] && \
    alias cp='rsync -ahPHAXSb --backup-dir=/tmp/rsync -e /dev/null'
#[[ -x "$(command -v podman)" ]] && alias docker=podman
