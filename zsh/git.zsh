# git aliases
alias gbd='git branch -d'
alias gcob='gcb'
alias grm='git status | grep deleted | awk "{print \$3}" | xargs git rm'
alias gs='gss'
alias gscrub='git branch --merged | grep -v master | xargs git branch -d'

# Speed up git tab-completions
# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
    _wanted files expl 'local files' _files
}
