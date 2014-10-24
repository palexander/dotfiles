# Set proper fpath
fpath=(/usr/local/share/zsh/functions)

# Antigen setup
source $HOME/src/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle bundler

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Git info from prezto git module (plus helper, which is needed)
antigen bundle sorin-ionescu/prezto modules/helper
antigen bundle $HOME/src/dotfiles/zsh_plugins/git-info

# Theme
antigen theme $HOME/src/dotfiles/zsh_themes/prompt_prezto_powerline_setup

# Tell antigen that you're done.
antigen apply

DEFAULT_USER=palexand

source $HOME/.profile