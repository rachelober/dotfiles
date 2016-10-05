# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rachel"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(brew bundler cp gem git github heroku osx postgres rails rbenv ruby sublime terminalapp zsh_reload)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim -f'
 else
   export EDITOR='mvim -f'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# User configuration
export NODE_PATH=/usr/local/lib/node
export PATH=$HOME/.bin:$HOME/bin:/usr/local/bin:$NODE_PATH:$PATH:/usr/local/sbin:/usr/local/mysql/bin:/usr/sbin:/usr/bin
export MANPATH=/usr/local/man:/usr/local/mysql/man:/user/local/git/man:$MANPATH

# rbenv
export RBENV_ROOT="/usr/local/var/rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# hosts
alias rhul='ssh -l brightpromise landofrhul.com'
alias ro='ssh -l rober rachelober.com'

# general shortcuts
alias ..='cd ..'
alias dev='cd ~/Development'
alias wtf='whoami | ps u'
alias log_cleanup='sudo rm -rf /private/var/log/asl/*'
alias show_hidden='defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder && open /System/Library/CoreServices/Finder.app'
alias hide_hidden='defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder && open /System/Library/CoreServices/Finder.app'

# ls
alias l='ls -lAh'
alias ll='ls -l'
alias la='ls -A'

# interactive/verbose commands
alias df='df -h'
alias mv='mv -i'
alias rm='rm -i'
for c in cp rm chmod chown; do
  alias $c="$c -v"
done

# git aliases
alias gbd='git branch -d'
alias gcob='gcb'
alias grm='git status | grep deleted | awk "{print \$3}" | xargs git rm'
alias gs='gss'

# Speed up git tab-completions
# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
    _wanted files expl 'local files' _files
}

# Clean up merged branches
alias gscrub='git branch --merged | grep -v master | xargs git branch -d'

# OSX doesn't have wget
alias wget='curl -O'

# Postgres for Mac OS X
if [ -x /usr/local/pgsql ]; then
  export PATH=/usr/local/pgsql/bin:$PATH
fi

# commands to control local postgres installation
# paths are for osx installation via macports
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgrestart='pg_ctl -D /usr/local/var/postgres restart'
alias pgstatus='pg_ctl -D /usr/local/var/postgres status'

# This way you tell zsh comp to take the first part of the path to be exact, and to avoid partial globs.
# http://lethalman.blogspot.com/2009/10/speeding-up-zsh-completion.html
zstyle ':completion:*' accept-exact '*(N)'
