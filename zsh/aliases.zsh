# projects
alias dotfiles="cd ~/.dotfiles && mvim ~/.dotfiles"
alias ohmyzsh="cd ~/.oh-my-zsh && mvim ~/.oh-my-zsh"
alias settings="cd ~/Development/laptop-settings && mvim ~/Development/laptop-settings"

# shortcuts
alias wtf="whoami | ps u"
alias log_cleanup="sudo rm -rf /private/var/log/asl/*"
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder && open /System/Library/CoreServices/Finder.app"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder && open /System/Library/CoreServices/Finder.app"
alias hdbusy="sudo lsof +D '/Volumes/My Passport'"
