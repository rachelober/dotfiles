function {
    local hname="$(uname -n 2>/dev/null)"
    local os="$(uname -s 2>/dev/null)"
    local arch="$(uname -m 2>/dev/null)"
    print -N "\e[44;1m $hname \e[0m\e[44m ( $arch / $os ) \n"
    uptime 2>/dev/null
    print -N "\e[0m\n"
}

if [ "`/bin/hostname`" = "zerowing" ]; then 
  /usr/bin/screen -x;
fi
