dotfiles=$HOME/.dotfiles
gitrepo=https://github.com/rachelober/dotfiles.git

function log() {
	echo "\033[32;1m$*\033[0m"
}

function warning() {
	echo "\033[31;1m$*\033[0m"
}

function link() {
	src=$1
	dest=$2
	
	if [ -e $dest ]
	then
		if [ -h $dest ]
		then
			return
		else
			# Rename files with a ".old" extension.
			warning "$dest file already exists, renaming to $dest.old..."
			backup=$dest.old
			mv -v $dest $backup
		fi
	fi

	log "Linking $src"
  ln -vsf $src $dest
}

cd $dotfiles

if [ -e $dotfiles ]
then
  warning "You already have dotfiles installed, updating from git..."
	git pull --rebase origin master
fi

log "Installing dotfiles..."
for path in .*
do
	case $path in
		.|..|.git)
			continue
			;;
		*)
			link $dotfiles/$path $HOME/$path
			;;
	esac
done

log "Dotfiles now installed!"