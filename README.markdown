# Rachel's dotfiles

## About

I'm a Ruby on Rails developer and use vim. These include some helpful shortcuts and settings I've become accustomed to. Please feel free to use/copy/steal whatever you see here because I've done the same in order to find the perfect fit for myself.

## Install

## Shell dotfiles

This doesn't include any dotfiles for shells. Therefore it integrates well with zsh/tcsh/bash. Personally, I use [my own fork of oh-my-zsh](https://github.com/rachelober/oh-my-zsh) and therefore run this command after bootstrapping.

    wget --no-check-certificate https://raw.github.com/rachelober/oh-my-zsh/master/tools/install.sh -O - | sh
    
Or the manual way:

1. Clone the repository

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

2. Create a new zsh config by copying the zsh template we’ve provided.

    NOTE: If you already have a ~/.zshrc file, you should back it up. cp ~/.zshrc ~/.zshrc.orig in case you want to go back to your original settings. cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    3. Set zsh as your default shell:

    chsh -s /bin/zsh
    4. Start / restart zsh (open a new terminal is easy enough…)