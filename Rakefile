#!/usr/bin/ruby

require 'rake'

desc "install dotfiles to home directory"
task :install do
  Dir['*'].each do |file|
    next if %w{ Rakefile README dotfiles.tmproj }.include? file
    
    # remove the old file
    system %Q{rm "$HOME/.#{file}"}
    
    # make a symbolic link to the new file
    puts "Linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end

  # create a history file
  puts "Touching history file ~/.zsh_history"
  system %Q{touch ~/.zsh_history}
  
  # create a local zsh file
  puts "Touching local zsh file ~/.zsh_local"
  system %Q{touch ~/.zsh_local}

  # git push on commit
  system %Q{echo 'git push' > .git/hooks/post-commit}
  system %Q{chmod 755 .git/hooks/post-commit}
end