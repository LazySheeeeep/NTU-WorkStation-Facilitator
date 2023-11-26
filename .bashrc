# BASHRC (co-operate with .shrc, .profile)
#
#
 
## BASH: this will run on each non-login and interactive shell.
echo "${BASH_SOURCE[0]}: running $HOME/.profile"
. $HOME/.profile
