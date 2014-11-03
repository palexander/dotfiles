ln -s $HOME/src/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/src/dotfiles/profile $HOME/.profile
mkdir -p $HOME/Library/Application\ Support/Sublime\ Text\ 3
ln -s $HOME/Dropbox/Profile/ST3/Backup $HOME/Library/Application\ Support/Sublime\ Text\ 3/
ln -s $HOME/Dropbox/Profile/ST3/Installed\ Packages $HOME/Library/Application\ Support/Sublime\ Text\ 3/
ln -s $HOME/Dropbox/Profile/ST3/Packages $HOME/Library/Application\ Support/Sublime\ Text\ 3/
ln -s $HOME/src/dotfiles/tmux $HOME/.tmux.conf
hardlink $HOME/src/dotfiles/zsh_history $HOME/.zsh_history
ln -s $HOME/src/dotfiles/gitconfig $HOME/.gitconfig