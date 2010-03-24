# source all the configs in .zsh (in the correct order)
. ~/.zsh/functions.zsh
. ~/.zsh/environment.zsh
. ~/.zsh/aliases.zsh
. ~/.zsh/comp.zsh
. ~/.zsh/history.zsh
. ~/.zsh/mac.zsh
. ~/.zsh/options.zsh

# source the local config
[[ -f ~/.zsh_local ]] && .  ~/.zsh_local

# source rvm
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# don't end with errors
true
