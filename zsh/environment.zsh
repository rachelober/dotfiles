#--------------------------------------------------------------------------
# environment
#--------------------------------------------------------------------------

export PS1=$'[%{\e[1;31m%}%*%{\e[0m%}][%{\e[1;35m%}%~%{\e[0m%}][%{\e[1;32m%}%n@%m%{\e[0m%}]\n%% '
export TERM=rxvt
export PATH="~/bin:~/www/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# color ls output
if [ -x /arch/gnu/bin/ls ]; then
	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=33:so=01;35:bd=33;01:cd=33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
    alias ls="/arch/gnu/bin/ls --color"
elif ls --color >/dev/null 2>&1; then
    export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=33:so=01;35:bd=33;01:cd=33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
	alias ls="ls --color"
elif [ "$HOSTTYPE" = "Darwin" ]; then
	export CLICOLOR=1
	export LSCOLORS='gxfxcxdxbxegedabagacad'
	alias ls='ls -G'
else
    alias ls="ls -F"
fi

# find an editor
export EDITOR='mate -w'

# no messages
(
    mesg n
    mesg -n
) >/dev/null 2>&1

# handy host variabels
if [ -z $HOSTNAME ]; then
    if which hostname >/dev/null 2>&1; then
        HOSTNAME=`hostname`
    elif which uname >/dev/null 2>&1; then
        HOSTNAME=`uname -n`
    else
        HOSTNAME=unknown fi
fi
if [ -z $HOSTTYPE ]; then
    if which uname >/dev/null 2>&1; then
        HOSTTYPE=`uname -s`
    else
        HOSTTYPE=unknown
    fi
fi
export HOSTNAME HOSTTYPE

# GNU grep
if grep --color=auto 0 /etc/passwd >/dev/null 2>&1; then
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'
fi

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
# zsh 4 options
#--------------------------------------------------------------------------

# Changing Directories
setopt auto_cd auto_pushd pushd_ignore_dups pushd_silent

# Completion
setopt auto_param_slash glob_complete list_beep list_packed list_rows_first

# History
setopt append_history
unsetopt bang_hist extended_history

# Job Control
setopt notify

# Other
setopt no_beep

#--------------------------------------------------------------------------
# history control
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