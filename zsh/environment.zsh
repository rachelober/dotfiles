#--------------------------------------------------------------------------
# environment
#--------------------------------------------------------------------------

export PS1=$'[%{\e[1;31m%}%*%{\e[0m%}][%{\e[1;35m%}%~%{\e[0m%}][%{\e[1;32m%}%n@%m%{\e[0m%}]\n%% '
export TERM=rxvt
export PATH="~/bin:~/www/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# GNU grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
 
# GNU and BSD ls colorization.
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=33:so=01;35:bd=33;01:cd=33;01:or=01;05;37;41:mi=01;37;41:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
export LSCOLORS='ExGxFxdxCxDxDxcxcxxCxc'
export CLICOLOR=1

# Linux colors
if _is Linux; then
    if _try ls --color; then
        alias ls='ls --color'
    fi
fi

# Utility variables.
if which hostname >/dev/null 2>&1; then
  HOSTNAME=`hostname`
elif which uname >/dev/null 2>&1; then
  HOSTNAME=`uname -n`
else
  HOSTNAME=unknown
fi
export HOSTNAME
 
# HOSTTYPE = { Linux | OpenBSD | SunOS | etc. }
if which uname >/dev/null 2>&1; then
  HOSTTYPE=`uname -s`
else
  HOSTTYPE=unknown
fi
export HOSTTYPE

# PAGER
if _has less; then
    export PAGER=less
fi

# EDITOR
if _has mate; then
	export EDITOR=mate VISUAL=mate
elif _has vim; then
  export EDITOR=vim VISUAL=vim
elif _has vi; then
  export EDITOR=vi VISUAL=vi
fi

# GNU grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# locale support
if [ -z $$LC_ALL ]; then
  export LC_ALL=C
fi
if [ -z $LANG ]; then
  export LANG=en_US
fi

# postgresql
for i in /usr/local/pgsql/data /var/lib/postgresql/data; do
  [ -d $i ] && export PGDATA=$i
done

#--------------------------------------------------------------------------
# options
#--------------------------------------------------------------------------

# Changing Directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
 
# Completion
setopt auto_param_slash
setopt glob_complete
setopt list_beep
setopt list_packed
setopt list_rows_first
setopt no_beep
 
# History
setopt append_history
unsetopt bang_hist
unsetopt extended_history
 
# Job Control
setopt notify
 
# Input/Output
unsetopt clobber

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