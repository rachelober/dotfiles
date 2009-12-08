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
 
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initializing new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi