export PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH:/usr/sbin:/usr/bin"

export MANPATH="/usr/local/man:$MANPATH"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
