# This way you tell zsh comp to take the first part of the path to be exact, and to avoid partial globs.
# http://lethalman.blogspot.com/2009/10/speeding-up-zsh-completion.html
zstyle ':completion:*' accept-exact '*(N)'
