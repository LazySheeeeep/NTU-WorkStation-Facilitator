# profile for sh/bash
# Sat Nov 25 02:12:34 CST 2023
#
# maintained by David Deng

export LC_ALL=zh_TW.UTF-8

newhome="/tmp2/$LOGNAME"

if [ ! -d "$newhome" ]; then
    mkdir "$newhome"
fi

if [ "$HOME" != "$newhome" ]; then
    export ORIGIN="$HOME"
    export HOME="$newhome"
    echo ">>> Home shifting >>>"
    echo "$(pwd)/.profile: Shifted home from $ORIGIN to $HOME."
    cp -f "$ORIGIN/.shrc" "$HOME/.shrc"
    cp -f "$ORIGIN/.bashrc" "$HOME/.bashrc"
    cp -f "$ORIGIN/.profile" "$HOME/.profile"
    echo "$(pwd)/.profile: .shrc, .bashrc and .profile were all copied to new home."
    echo "<<< Home shifting <<<"
fi

unset newhome

if [ ! -e "$ORIGIN" ]; then
    export ORIGIN=$(echo "$XDG_DATA_DIRS" | awk -F: '{print $2}' | awk -F. '{print $1}' | sed 's:/$::')
fi

# don't include current path
PATH=$ORIGIN/.local/bin:$ORIGIN/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin
export PATH

# common env
export USER=$LOGNAME
export IGNOREEOF=23
export ENV="$ORIGIN/.shrc"
export BLOCKSIZE=1k
export NNTPSERVER=news.ntu.edu.tw
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export LESSCHARDEF=8bcccbcc18b.   # Used for command less
export LESS="-sPm-LESS-"

# common settings with programs
ulimit -S -c 0    # core dumpsize
umask 022

if [ $SHELL != "/bin/sh" ]; then
   echo "$(pwd)/.profile: running $ENV"
   . $ENV
fi

# those require external programs
if [ ! -f "$ORIGIN/.hushlogin" ]; then
    if [ -x /bin/mail ] ; then 
    /bin/mail -E
    case $? in
        0)
        echo "You have new mail."
        ;;
        2)
        echo "You have mail."
        ;;
    esac
    fi

    if [ `screen -ls | wc -l` -gt 2 ]; then
    echo ""
    echo "There're screens detached! please use 'screen -r'."
    echo ""
    fi

    date
    mesg y 2>/dev/null
fi


echo ""

tmux_ls=$(tmux ls 2>/dev/null)
if [ $? -eq 0 ]; then
    echo "tmux: $tmux_ls"
    echo ""
fi
unset tmux_ls

cd $HOME
