unsetenv TERMINFO
unsetenv TERMINFO_DIRS
foreach dir (/usr/share/terminfo /usr/share/misc/terminfo /opt/local/share/terminfo /usr/local/share/terminfo)
	if ( -d $dir ) then
		if ($?TERMINFO_DIRS) then
			setenv TERMINFO_DIRS ${TERMINFO_DIRS}:${dir}
		else
			setenv TERMINFO_DIRS ${dir}
		endif
	endif
end


if ($?prompt) then
	if ($uname == "FreeBSD") then
		set shorthostname=`hostname -s`
	else if ($uname == "Darwin") then
		set shorthostname=`hostname -s`
	else
		set shorthostname=`echo ${HOST} | sed 's/\([^.]*\).*/\1/'`
	endif

	# set up REMOTEHOST based on SSH_CLIENT if REMOTEHOST not already set!
	if ($?SSH_CLIENT) then
		if (! $?REMOTEHOST) then
			setenv REMOTEHOST "`echo ${SSH_CLIENT} | cut -f1 -d' '`"
		endif
	endif

	# set up DISPLAY based on REMOTEHOST if DISPLAY not set!
	#if ($?REMOTEHOST) then
		#if (! $?DISPLAY) then
			#setenv DISPLAY "${REMOTEHOST}:0.0"
		#endif
	#endif

	if ($uname == "Darwin") then
		bindkey "[7~" beginning-of-line
		bindkey "[8~" end-of-line
		bindkey "[1;5D" backward-word
		bindkey "[1;5C" forward-word
	endif

	bindkey "Od" backward-word
	bindkey "Oc" forward-word

	stty intr ^C
	stty kill 
	#stty erase 

	if ($uname == "Darwin") then
		echo "]1;${shorthostname}]2;${USER}@${shorthostname} ${PWD:s,/Users/franc,~,}"
	else
		echo "]1;${shorthostname}]2;${USER}@${shorthostname} ${PWD:s,/home/franc,~,}"
	endif
endif

