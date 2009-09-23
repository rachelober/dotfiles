#--------------------------------------------------------------------------
# everything below here is automatically added by compinstall
#--------------------------------------------------------------------------

# recently changed:
#zstyle ':completion:*' completer _complete _correct _approximate _prefix
#zstyle ':completion:*' max-errors 3
#zstyle ':completion:*' substitute 0

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors "di=01;33:ma=43;30"
zstyle ':completion:*' max-errors 0
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.zsh/comp.zsh"

autoload -U compinit
compinit -u
# End of lines added by compinstall

# this should be the default behavior, IMHO
zmodload -i zsh/complist
bindkey -M menuselect '^M' accept

#--------------------------------------------------------------------------
# redirection symbol after completion
# http://www.zsh.org/mla/users/2006/msg00690.html
#--------------------------------------------------------------------------

self-insert-redir() {
    integer l=$#LBUFFER
    zle self-insert
    (( $l >= $#LBUFFER )) && LBUFFER[-1]=" $LBUFFER[-1]"
}
zle -N self-insert-redir
for op in \| \< \> \& ; do
    bindkey "$op" self-insert-redir
done

#--------------------------------------------------------------------------
# custom completers
#--------------------------------------------------------------------------

# this one's from Ari
# Function Usage: doc packagename
#                 doc pac<TAB>
function doc () { cd /usr/share/doc/$1 && ls }
compdef '_files -W /usr/share/doc -/' doc

# other completions
compdef _perl_modules vipm gvipm
compdef '_command_names -e' tsocks
compdef '_files -g "*.{pdf,ps}"' evince
compdef '_files -g "*.tex"' gen
compdef '_files -g "*.bom"' lsbom
