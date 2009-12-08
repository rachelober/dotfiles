#--------------------------------------------------------------------------
# history
#--------------------------------------------------------------------------

SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zsh_history
REPORTTIME=10 # print elapsed time when more than 10 seconds

# make sure history file isn't owned by root
# (a common problem)
if [ -n "$HISTFILE" -a ! -w $HISTFILE ]; then
  echo
  echo "[31;1;5m HISTFILE [$HISTFILE] not writable! [0m"
  echo
fi