if ($?prompt) then
	set uname=`uname`

	if ($uname == "FreeBSD") then
		set shorthostname=`hostname -s`
	else if ($uname == "Darwin") then
		set shorthostname=`hostname -s`
	else
		set shorthostname=`echo ${HOST} | sed 's/\([^.]*\).*/\1/'`
	endif

	setenv GIT_SHOW_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'"
	set prompt="%~ %{\033[33m%}`$GIT_SHOW_BRANCH_CMD`%{\033[0m%} \nYes, master?"

	if ($uname == "Darwin") then
		alias cwdcmd 'set prompt="%~ %{\033[33m%}`$GIT_SHOW_BRANCH_CMD`%{\033[0m%} \nYes, master?" ; echo "]2;${USER}@${shorthostname} ${PWD:s,/Users/franc,~,}"'
	else
		alias cwdcmd 'set prompt="%~ %{\033[33m%}`$GIT_SHOW_BRANCH_CMD`%{\033[0m%} \nYes, master?" ; echo "]2;${USER}@${shorthostname} ${PWD:s,/home/franc,~,}"'
	endif

	# This next section is also in terminal.csh
	if ($uname == "Darwin") then
		echo "]1;${shorthostname}]2;${USER}@${shorthostname} ${PWD:s,/Users/franc,~,}"
	else
		echo "]1;${shorthostname}]2;${USER}@${shorthostname} ${PWD:s,/home/franc,~,}"
	endif
endif

