# !/usr/bin/env ruby

# from http://errtheblog.com/posts/89-huba-huba

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install|Dot-Files|vim|zsh/
  target = File.join(home, ".#{file}")
  `ln -s #{File.expand_path file} #{target}`
end

# create a history file
`touch ~/.zsh_history`

# git push on commit
`echo 'git push' > .git/hooks/post-commit`
`chmod 755 .git/hooks/post-commit`