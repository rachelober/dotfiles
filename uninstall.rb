# !/usr/bin/env ruby

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install|Dot-Files|README/
  target = File.join(home, ".#{file}")
  `rm #{target}`
end

# create a history file
`touch ~/.zsh_history`