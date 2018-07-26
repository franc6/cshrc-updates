These are various parts of my .cshrc file, broken out into separate, usable chunks.  There might be redundancies between them.

* gitbranch.csh shows which branch of a git project is active when the current directory is controlled by git.
* path.csh initializes $PATH, $MANPATH, and any variables those depend on.
* sshagent.csh connects to a running instance of ssh-agent, or starts it up if it's not running.
* terminal.csh includes terminal settings for running in XTerms (or similar), setting the title, keybindings, and more.