#--------------------------------------------------------------------------
# ccs specific stuff
#--------------------------------------------------------------------------

if [ -d /ccs ]; then
	export PATH=/arch/beta/bin:/usr/xpg4/bin:$PATH
	export MANPATH=/priv/unix/packages/zsh-4.0.6/man:/priv/unix/packages/zsh-4.0.4/man:$MANPATH
	
	# general aliases
	alias peek='ypcat passwd | grep -i'
	alias ldfix='LD_LIBRARY_PATH=/arch/Xapps/lib:/arch/gnu/lib:/arch/unix/lib'
	alias finger='~wan/bin/uinfo'
	
	# no core dumps. we've got quotas!
	limit coredumpsize 0
	
	# java
	export CLASSPATH=.:$CLASSPATH:$ORACLE_CLASSES

	# find a port in the given room
	portlook() { grep $1 /ccs/adm/etc/switch.txt }

	# (i forgot what this does)
	hostport() {
    	/ccs/src/homegrown/pbquick-1.0/hostbase.sh -dbquery -autobuild -progress \
    	-port $* -printall -printfield -sep "\n" -recsep "\n\n"
	}

	# find a host by hostname or cname in hostbase
	hostlook() {
		/ccs/src/homegrown/pbquick-1.0/hostbase.sh -dbquery -autobuild -progress \
		-host $* -printall -printfield -sep "\n" -recsep "\n\n"
	}

	# softinst function (from dnb)
	findpackage () {
    	if [ $# != 2 ]; then
			echo "usage: findpackage <arch> <package>"
		else
        	/arch/gnu/bin/find  /arch/$1 -name packages -prune -o -type l -ls |grep packages/$2 | awk '{ print $11 }'
    	fi
	}

	# su2 alias
	function sux () {
    	su=`which su2`
    	echo "[41m$su $*[0m"
    	$su $@
	}
fi