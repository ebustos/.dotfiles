# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    export TERM=xterm-256color
    ;;
xterm-*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
#linux)
#    fbterm -- screen -q
#    ;;
#*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
#    export TERM=xterm-256color
#    ;;
*)
    ;;
esac
export force_color_prompt=yes

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export HISTCONTROL=ignoreboth
export CRAFTY_BOOK_PATH=/usr/share/crafty
export CRAFTY_TB_PATH=/usr/share/crafty/endgame

export REPREPRO_BASE_DIR=/var/repos
export PS_FORMAT=pid,tty,state,pcpu,pmem,etime,command

export BROWSER=chromium
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
#export AWT_TOOLKIT=MToolkit
export PYTHONSTARTUP=$HOME/.pythonrc
#sudo nvidia-settings -a InitialPixmapPlacement=0
export JAVA6_HOME=/usr/lib/jvm/java-6-openjdk-amd64
export JAVA7_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export JAVA8_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export STUDIO_JDK="$JAVA8_HOME"
export ANDROID_HOME="$HOME/tools/android/sdk"

PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/tools/android-studio/bin:$PATH"
export PATH
