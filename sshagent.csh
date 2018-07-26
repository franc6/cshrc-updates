if ($?prompt) then
	# An interactive shell -- set some stuff up
	set uname=`uname`

	if ($uname != "Darwin") then
		setenv sshagentfile $HOME/.ssh.`hostname`
		if (-f $sshagentfile) then
			source $sshagentfile
			setenv whoami `whoami`
			setenv uid `id -u $whoami`
			setenv testpid `pgrep -u $uid ssh-agent | grep $SSH_AGENT_PID`
			if (`echo $SSH_AGENT_PID` == `echo $testpid`) then
				echo "Using ssh-agent with PID: $SSH_AGENT_PID"
			else
				rm -f $sshagentfile
				ssh-agent -c > $sshagentfile
				source $sshagentfile
			endif
			unsetenv whoami
			unsetenv uid
			unsetenv testpid
		else
			ssh-agent -c > $sshagentfile
			source $sshagentfile
		endif
		unsetenv sshagentfile
	endif

endif
