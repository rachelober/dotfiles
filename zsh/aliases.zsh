# servers
# TODO: Home computer ips are all out of date, should update these eventually
# alias corvus='ssh -l rober 192.168.0.101'
# alias cygnus='ssh -l rober 192.168.0.102'
# alias pyxis='ssh -l rober 192.168.0.103'
alias rhul='ssh -l brightpromise landofrhul.com'
alias smithers='ssh -l rober rachelober.com'
alias tunnel='ssh -D 5222 rober@zerowing.ccs.neu.edu'
alias utopia='zerowing'
alias v2s='ssh -l rober v2s.org'
alias zerowing='ssh -l rober zerowing.ccs.neu.edu'

# general shortcuts
alias ..='cd ..'
alias dev='cd ~/Development'
alias update='sudo apt-get update'
alias whois='whois -h geektools.com'
alias wtf='whoami | ps u'
 
# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'
 
# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
 
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
	alias $c="$c -v"
done

# try to get top to sort by CPU usage
if [[ "$HOSTTYPE" != "Linux" ]]; then
	alias top='top -u'
fi

# Mac OS X doesn't come with wget.
if ! _has wget; then
	alias wget='curl -O'
fi

# Linux
alias Ag='sudo apt-get install'
alias As='apt-cache search'
alias Ai='apt-cache show'
alias Ar='sudo apt-get remove'
alias Arp='sudo apt-get remove --purge'
alias dsl='dpkg -l | grep -i'
alias dls='dpkg -L'
alias linuxlogs='tail -f /var/log/*.log'