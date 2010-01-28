# hosts
# TODO: Home computer ips are all out of date, should update these eventually
# alias corvus='ssh -l rober 192.168.0.101'
# alias cygnus='ssh -l rober 192.168.0.102'
# alias pyxis='ssh -l rober 192.168.0.103'
alias rhul='ssh -l brightpromise landofrhul.com'
alias smithers='ssh -l rober rachelober.com'
alias tunnel='ssh -D 5222 -l rober zerowing.ccs.neu.edu'
alias utopia='zerowing'
alias v2s='ssh -l rober v2s.org'
alias zerowing='ssh -l rober zerowing.ccs.neu.edu'

# general shortcuts
alias ..='cd ..'
alias dev='cd ~/Development'
alias wtf='whoami | ps u'
alias ZshReinstall='ruby ~/Development/Dot-Files/uninstall.rb; ruby ~/Development/Dot-Files/install.rb;'
alias ZshSource='. ~/.zshrc'

# open up specific projects
alias dot='mate ~/Development/Dot-Files'
 
# ls
alias ls='ls -F'
alias l='ls -lAh'
alias ll='ls -l'
alias la='ls -A'
 
# git
alias ga='git add'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm='git status | grep deleted | awk '{print \$3}' | xargs git rm'
 
# rails
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest -rails'
alias tlog='tail -f log/development.log'
alias scaffold='script/generate nifty_scaffold'
alias migrate='rake db:migrate db:test:clone'
alias rst='touch tmp/restart.txt'

# interactive/verbose commands
alias df='df -h'
alias mv='mv -i'
alias rm='rm -i'
for c in cp rm chmod chown; do
	alias $c='$c -v'
done

# try to get top to sort by CPU usage
if ! _is Linux; then
	alias top='top -u'
fi

# Mac OS X doesn't come with wget.
if ! _has wget; then
	alias wget='curl -O'
fi

# Linux
if _is Linux; then
  alias Ag='sudo apt-get install'
  alias As='apt-cache search'
  alias Ai='apt-cache show'
  alias Ar='sudo apt-get remove'
  alias Arp='sudo apt-get remove --purge'
  alias dsl='dpkg -l | grep -i'
  alias dls='dpkg -L'
  alias linuxlogs='tail -f /var/log/*.log'
fi