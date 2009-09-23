# !/usr/bin/env bash
# vim:ft=bash:sw=4:ts=4:et:
# (requiring /bin/bash because Solaris' /bin/sh sucks)
# ---------------------------------------------------------------------
#  _                 _       _                        _
# | |__   ___   ___ | |_ ___| |_ _ __ __ _ _ __   ___| |__
# | '_ \ / _ \ / _ \| __/ __| __| '__/ _` | '_ \ / __| '_ \
# | |_) | (_) | (_) | |_\__ \ |_| | | (_| | |_) |\__ \ | | |
# |_.__/ \___/ \___/ \__|___/\__|_|  \__,_| .__(_)___/_| |_|
#                                         |_|
# Modified from Ian Langworth's
# Bootstrap Installation
# -----------------------------------------------------------------

# feedback functions
Msg () {
    echo "[32;1;5m * [0m$*"
}
Die () {
    echo "[31;1;5m * [0m$*"
    exit 1
}

# helper functions
do_symlinks () {
    Msg "Symlinking new .zhistory, .zshrc, .zlogout and .zprofile"
    for i in $HOME/.zsh/_*.zsh; do
        ln -sf "$i" "$HOME/$(echo $i | perl -lpe's{.+/_(.+)\.zsh}{.$1}')"
    done
    Msg "Local installation finished."
}

do_install () {
    host='rober@denali.ccs.neu.edu'
    dotfiles='
        .zsh
        .vim
        .signature
        .irssi
    '

    Msg "Moving existing .zsh directory out of the way."
    old="$HOME/OLD-ZSH-DIR-TO-DELETE"
    if [ -d "$HOME/.zsh" ]; then
        mv "$HOME/.zsh" $old
    fi

    Msg "Downloading files from $host."
    (
        cd
        # some `tar' binaries don't like stdin
        f=".zsh-TEMP-INSALL.$$.tar"
        touch $f
        chmod 0600 $f
        ssh $host /arch/gnu/bin/tar -cz --exclude=.svn $dotfiles >$f
        tar -xzf $f
        rm $f
    )

    do_symlinks;

    Msg "Linking .vimrc."
    for i in vimrc; do
        ln -sf "$HOME/.vim/$i" "$HOME/.$i"
    done

    # we have to do a secondary delete later on because of NFS syncing
    Msg "Will remove existing .zsh directory in a few seconds."
    rm -rf $old
    (sleep 100 && rm -rf $old) &

    if [ -r ~/.bootstrap-post.sh ]; then
        Msg "Running bootstrap post-install script"
        . ~/.bootstrap-post.sh
    fi

    Msg "Installation finished."
}

# parse command line arguments and do stuff
if [ "$1" = "-l" ]; then
    do_symlinks
    exit
elif [ $# = 0 ]; then
    if [ "$(hostname)" = "utopia.ccs.neu.edu"  ]; then
        Die "Can't run bootstrap on our source host!"
    else
        do_install
    fi
else
    echo <<END_USAGE
usage: $0 [ -l ]
options:
    -l      don't scp any files, just do symlinks
END_USAGE
    exit 1
fi
