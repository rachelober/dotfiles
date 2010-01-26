#--------------------------------------------------------------------------
# options
#--------------------------------------------------------------------------

# Changing Directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
 
# Completion
setopt auto_param_slash
setopt glob_complete
setopt list_beep
setopt list_packed
setopt list_rows_first
setopt no_beep
 
# History
setopt append_history
unsetopt bang_hist
unsetopt extended_history
 
# Job Control
setopt notify
 
# Input/Output
unsetopt clobber

# Variable prompt
setopt promptsubst