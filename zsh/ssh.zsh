#-------------------------------------------------------------------
# SSH hosts, aliases and completion
#-------------------------------------------------------------------

# create login shortcuts from SSH config file, which has 'Host' directives
for host in $(grep -E '^Host +\w+$' $HOME/.ssh/config | awk '{print $2}'); do
    alias $host="ssh $host"
done

# CCS' SSH is out of date, so I can't do this from .ssh/config
if [ "$HOSTTYPE" = "SunOS" ]; then
    alias a="ssh ccs"
else
    alias a="ssh -C -D 1080 ccs"
fi

# preload SSH completion so that _ssh_hosts can be overridden
autoload _ssh
_ssh

# override _ssh_hosts to use .ssh/config
# -> http://www.zsh.org/mla/users/2003/msg00937.html
_ssh_hosts () {
  if [[ "$IPREFIX" == *@ ]]; then
    _combination -s '[:@]' my-accounts users-hosts "users=${IPREFIX/@}" hosts "$@"
  else
    _combination -s '[:@]' my-accounts users-hosts \
      ${opt_args[-l]:+"users=${opt_args[-l]:q}"} hosts "$@"
      # vims hiliting is stupid, hence this line"
  fi
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

#-------------------------------------------------------------------
# SSH agent tricks
#-------------------------------------------------------------------

# set up agent
if [ -e  ~/.keychain/$HOSTNAME-sh ]; then
    source ~/.keychain/$HOSTNAME-sh >/dev/null 2>&1
fi

# the problem with screen is that old sessions lose ssh-agent awareness. this
# little system fixes it.
local agentdir=~/.latestssh
local agentfile=$agentdir/$HOST.sh
mkdir -p $agentdir
chmod 0700 $agentdir >/dev/null
if [ -n "$SSH_AUTH_SOCK" -a -z $STY ]; then
    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >$agentfile
    chmod 0600 $agentfile >/dev/null
fi
# ...existing windows can run this alias
alias latestssh="source $agentfile; ls \$SSH_AUTH_SOCK"
# ...new windows get it automatically
if [ -n "$STY" ]; then
    source $agentfile
fi

# try to set up a fancy-ass ssh password thingey -- absolute paths only
if [ -n "$DISPLAY" ]; then
    for cmd in /usr/bin/gtk-led-askpass /usr/bin/ssh-askpass ~/bin/ssh-askpass.SunOS; do
        if [ -x "$cmd" ]; then
            SSH_ASKPASS=$cmd
            break
        fi
    done
    export SSH_ASKPASS
fi

# only trust absolute paths for keychain
for cmd in ~/bin/keychain ~/local/bin/keychain /usr/bin/keychain /arch/unix/bin/keychain; do
    if [ -x "$cmd" ]; then
        keychainbin=$cmd
        break
    fi
done
if [ -n $keychainbin ]; then
    alias agent="$keychainbin id_dsa && source ~/.keychain/$HOST-sh"
else
    alias agent="echo command not found: keychain"
fi

