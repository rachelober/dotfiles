if [ -e ~/.zshdebug ]; then
  function LOG () { echo "[36;1m# $*[0m" }
else
  function LOG () { }
fi
LOG "Starting Zsh"
 
# Returns whether the given command is executable or aliased.
function _has() {
  return $( whence $1 >/dev/null )
}
 
# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
function _try() {
  return $( eval $* >/dev/null 2>&1 )
}
 
# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
function _is() {
  return $( [ "$HOSTTYPE" = "$1" ] )
}

function _prepend_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}
 
function _append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}