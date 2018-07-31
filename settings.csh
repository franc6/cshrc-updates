
setenv EDITOR vim
setenv MAIL '{sheridan.tcsaf.com}'

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set uname=`uname`

	set filec
	set history=100
	set savehist=100
	set autolist=ambiguous
	set listmaxrows=6

	# aliases
	# alias edit 'editor \!* -name editor &';
	if ($uname == "Darwin") then
		alias vi vim
		alias ldd otool -L
	else
		# Alias vi differently in case we're coming from a mac xterm,
		# which doesn't like to run vim from a different host. :(
		alias vi vim -u /home/franc/.vimrc;
	endif
	alias h history 25
	alias j jobs -l
	alias ssh 'ssh \!* ; cwdcmd'
	#alias larger "echo ']50;#+'"
	#alias smaller "echo ']50;#-'"
	#alias normal "echo ']50;#'"
	#alias extralarge 'larger ; larger ; larger ; larger'
	#alias pushtophone "obexapp -a 00:07:e0:f1:83:8f -c -C OPUSH"

endif

if (`uname` == "Darwin") then
	limit coredumpsize unlimited
endif
