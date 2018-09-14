#install antigen if not installed
if [[ ! -f ./antigen.zsh ]]; then 
    curl -L git.io/antigen > ./antigen.zsh
else
    :
fi

source $HOME/.dotfiles/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://github.com/kitian616/tq-zsh-theme tq

# Tell Antigen that you're done.
antigen apply
