# Aliases
alias apache2ctl='sudo /opt/local/apache2/bin/apachectl'
alias rdev='ssh palexand@ncbodev-ror1.stanford.edu'
alias rstage='ssh palexand@stage.bioontology.org'
alias rprod='ssh palexand@bioportal.bioontology.org'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias b='bundle exec '
alias br='bundle exec ruby '
alias listening='lsof -i | grep LISTEN'
alias glog='git log -n 15'
alias pull='git pull'
alias push='git push'
alias master='git checkout master'
alias staging='git checkout staging'

# Functions for aliasing
screensh() { ssh -t "$@" 'screen -RR -S main';}
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/local/share/pypy:/usr/local/share/npm/bin:$HOME/bin:$PATH

export HISTSIZE=10000

# Grep while ignoring .svn files
alias g="egrep --exclude=\*.svn\* --exclude=\*.log -r -n -i --color=always "

# Custom config for Ruby MRI. Increases memory usage, but it should be faster (especially Rails).
export RUBY_GC_HEAP_INIT_SLOTS=1250000
export RUBY_HEAP_SLOTS_INCREMENT=100000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1800000000
export RUBY_HEAP_FREE_MIN=12500

# jruby-specific options
export JRUBY_OPTS="--2.0 -J-XX:+CMSClassUnloadingEnabled -J-XX:+UseConcMarkSweepGC -J-XX:MaxPermSize=256m -J-Xmx10g"

# ulimit to unlimited
ulimit -S -n 2048

# Support for rbenv
eval "$(rbenv init - zsh)"

# golang support
export GOPATH=$HOME/Development/golang
export PATH=$PATH:$GOPATH/bin
export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOROOT/bin

# ncbo-related
export BP_SKIP_HEAVY_TESTS="1"

# tmux
export EDITOR='vim'
export DISABLE_AUTO_TITLE=true

# Homebrew Cask setup
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom" 