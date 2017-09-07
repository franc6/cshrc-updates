setenv GIT_SHOW_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'"
set prompt="%~ %{\033[33m%}`$GIT_SHOW_BRANCH_CMD`%{\033[0m%} \nYes, master?"
alias cd 'chdir \!*;set prompt="%~ %{\033[33m%}`$GIT_SHOW_BRANCH_CMD`%{\033[0m%} \nYes, master?"'
