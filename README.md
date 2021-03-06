# Reinstall Steps

- Install homebrew:
	- ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
- Install homebrew cask: 
  -	brew install caskroom/cask/brew-cask 
  -	brew tap caskroom/versions
  -	brew tap caskroom/fonts
- Cask env (moves applications to main folder)
  -	export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom" 
  -	This installs the applications in /usr/local/Caskroom and puts symlinks in /Applications. However, Alfred and Spotlight won't pick up symlinks. In Alfred, you can add /usr/local/Caskroom to the list of indexed directories to fix the problem, no solution for Spotlight.
- Configure OSX
  -	curl -L https://raw.githubusercontent.com/palexander/dotfiles/master/osx_settings.sh | sh 
- Install brew cask applications
  -	curl -L https://raw.githubusercontent.com/palexander/dotfiles/master/cask.sh | sh
- Install brew applications
  -	curl -L https://raw.githubusercontent.com/palexander/dotfiles/master/brew.sh | sh
- Install hardlink
  -	https://github.com/selkhateeb/hardlink
- Install mjolnir.io
  -	Config files here: https://github.com/palexander/dotfiles/tree/master/mjolnir
- Copy old ssh keys ($HOME/.ssh)
- Install antigen
  -	https://github.com/zsh-users/antigen
  -	Sample zsh config using antigen: https://github.com/palexander/dotfiles/blob/master/zshrc
- Symlink shell configs
	- curl -L https://raw.githubusercontent.com/palexander/dotfiles/master/symlinks.sh | sh
- Change default shell to zsh (not needed if using oh-my-zsh)
  -	sudo vim /etc/shells
  -	add "/usr/local/bin/zsh" to list
  -	chsh -s /usr/local/bin/zsh
- Kerberos config
	- Install Kerberos Commander: https://itservices.stanford.edu/service/ess/mac/kerberos
	- Users and Groups
		- Automatic Login: Off
		- Display Login Window As: Name and password
		- Edit /etc/pam.d/authorization and /etc/pam.d/screensaver to include this (likely just add default_principal to the first line):
			- auth       optional       pam_krb5.so use_first_pass use_kcminit default_principal
		- Password and username for your local account may need to match your sunet id and password
		- Log out / log back in
		- Run klist and see if you have any valid tokens
- Install ruby
  -	rbenv install 2.1.3
  -	rbenv global 2.1.3
- Install rbenv-gem-rehash
  -	https://github.com/sstephenson/rbenv-gem-rehash
  -	git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
- Copy bundler config
  -	cp -R $OLD_HOME/.bundler $HOME/
- Install bundler
  -	gem install bundler
- Copy tmuxinator conf
	- cp -R $OLD_HOME/.tmuxinator $HOME/
- Configure solr
	- See ncbo/documentation
- tmux
	- Link config file
	- Part of https://github.com/palexander/dotfiles/blob/master/symlinks.sh
- Sublime
	- Link directories in Application Support to Dropbox
	- Part of https://github.com/palexander/dotfiles/blob/master/symlinks.sh
- Get old version of itsycal (~0.4) that supports clock in menu bar to replace default clock

