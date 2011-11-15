if [ -d ~/.dotfiles ]
then
  echo "\033[0;33mYou already have dotfiles installed.\033[0m You'll need to remove ~/.dotfiles if you want to install"
  exit
fi

echo "\033[0;34mCloning dotfiles...\033[0m"
/usr/bin/env git clone https://github.com/rachelober/dotfiles.git ~/.dotfiles

echo "\033[0;34mMoving existing dotfiles...\033[0m"
for f in ~/.dotfiles/*
do
	echo "Processing $f..."
	if [ -f ~/.$f ] || [ -h ~/.$f ]
	then
		echo "Moving .$f file to .$f.old..."
		cp ~/.$f ~/.$f.old;
	fi
	echo "Linking new .$f..."
	ln -s ~/.dotfiles/$f ~/.$f;
done