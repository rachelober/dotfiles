# Create login shortcuts from SSH config file, which has 'Host' directives.
# (If you set up an ssh host in .ssh/config, it become an alias.)
for host in $(grep -E '^Host +\w+$' $HOME/.ssh/config | awk '{print $2}'); do
    alias $host="ssh $host"
done
 
# Override _ssh_hosts to use .ssh/config. This speeds up ssh/scp tab-completion
# *considerably* on installations with lots of hosts.
#
# See: http://www.zsh.org/mla/users/2003/msg00937.html
autoload _ssh ; _ssh
function _ssh_hosts () {
  if [[ -r "$HOME/.ssh/config" ]]; then
      local IFS="   " key host
      while read key host; do
          if [[ "$key" == (#i)host ]]; then
              _wanted hosts expl host \
                  compadd -M 'm:{a-zA-Z}={A-Za-z} r:|.=* r:|=*' "$@" "$host"
          fi
      done < "$HOME/.ssh/config"
  fi
}
 
# Set up ssh agent if I've been using `keychain`.
for cmd in ~/bin/keychain /usr/bin/keychain; do
    if [ -x "$cmd" ]; then
        keychainbin=$cmd
        break
    fi
done
if [ -n $keychainbin ]; then
    if [ -e  ~/.keychain/${HOSTNAME}-sh ]; then
        source ~/.keychain/${HOSTNAME}-sh >/dev/null 2>&1
    fi
    alias agent="$keychainbin id_dsa && source ~/.keychain/$HOST-sh"
else
    alias agent="echo command not found: keychain"
fi
 
# A problem with screen is that old sessions lose ssh-agent awareness. This
# little system fixes it.
function {
    local agentdir=~/.latestssh
    local agentfile=$agentdir/$HOST.sh
 
    mkdir -p $agentdir
    chmod 0700 $agentdir >/dev/null
 
    if [ -n "$SSH_AUTH_SOCK" -a -z $STY ]; then
        rm -f $agentfile >/dev/null
        echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >$agentfile
        chmod 0600 $agentfile >/dev/null
    fi
 
    # ...existing windows can run this alias
    alias latestssh="source $agentfile; ls \$SSH_AUTH_SOCK"
 
    # ...new windows get it automatically
    if [ -n "$STY" ]; then
        source $agentfile
    fi
}