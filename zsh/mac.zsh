#--------------------------------------------------------------------------
# specific settings needed for Mac OS X
#--------------------------------------------------------------------------

# Postgres for Mac OS X
if [ -x /usr/local/pgsql ]; then
  export PATH=/usr/local/pgsql/bin:$PATH
fi
 
# Macports for Mac OS X
if [ -x /opt/local/bin/port ]; then
  _append_to_path /opt/local/bin
  _append_to_path /opt/local/sbin
  export MANPATH=/opt/local/share/man:$MANPATH
  
  alias Pg='sudo port -v install'
  alias Ps='port search'
  alias Pi='port info'
  alias Pr='sudo port uninstall'
  alias dsl='port installed | grep -i'
 
  function InitMacports () {
    cmds=(
      cat chgrp chmod chown cp dd df diff du false head
      ln ls mkdir mkfifo mv pwd rm rmdir sleep sort
      stat tail tee true uniq who whoami yes
    )

    for cmd in $cmds; do
      ln -vs /opt/local/bin/g$cmd /usr/local/bin/$cmd
    done
  }
fi
 
# Fink for Mac OS X
if [ -x /sw/bin/init.sh ]; then
  _append_to_path /sw/bin/init.sh
fi