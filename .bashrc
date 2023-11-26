# BASHRC (co-operate with .shrc, .profile)
#
#
 
## BASH: this will run on each non-login and interactive shell.
echo "$(pwd)/.bashrc: running $HOME/.profile"
. $HOME/.profile
