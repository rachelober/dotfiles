# source all the configs in .zsh
. ~/.zsh/functions.zsh
. ~/.zsh/environment.zsh
. ~/.zsh/aliases.zsh
. ~/.zsh/comp.zsh
. ~/.zsh/history.zsh
. ~/.zsh/leopard.zsh
. ~/.zsh/options.zsh
. ~/.zsh/ssh.zsh

# source the local config
[[ -f ~/.zsh_local ]] && .  ~/.zsh_local

# don't end with errors
true
