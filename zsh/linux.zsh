#--------------------------------------------------------------------------
# Linux
#--------------------------------------------------------------------------

# general aliases
alias linuxlogs='tail -f /var/log/*.log'

# apt (debian)
if [ -x /usr/bin/apt-get -o -x /sw/bin/apt-get ]; then
    alias Ag='sudo apt-get install'
    alias As='apt-cache search'
    alias Ai='apt-cache show'
    alias Ar='sudo apt-get remove'
    alias Arp='sudo apt-get remove --purge'
    alias dsl='dpkg -l | grep -i'
    alias dls='dpkg -L'

    function dpan () {
        pkgs=($(perl -le'print join " ",map {s/::/-/g;lc "lib$_-perl"}@ARGV' $@))
        echo ">> sudo apt-get install $pkgs"
        sudo apt-get install $pkgs
    }
fi

# portage (gentoo)
if [ -x /usr/bin/emerge ]; then
    alias Es='sudo emerge search'
    alias Ei='sudo emerge -k'
    alias Eip='emerge -pk'
    alias Er='sudo emerge -C'
    alias Erp='emerge -Cp'
    alias Eif='ACCEPT_KEYWORDS="~x86" sudo emerge'
fi

