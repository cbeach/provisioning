# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
set guifont=Ubuntu\ Mono\ for\ Powerline\ 12

#alias mc='java -Xmx1024M -Xms512M -cp $HOME/bin/minecraft.jar net.minecraft.LauncherFrame'
alias mc='$HOME/bin/games/MultiMC/MultiMC'
alias mcs='java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui'
alias tl='java -jar $HOME/bin/TechnicLauncher.jar'
alias nautilus='nautilus --no-desktop'

export PATH=/opt/couchbase/bin:$PATH
export PATH=$HOME/bin/:$PATH
export PATH=$HOME/bin/dev-tools/eclipse:$PATH
export PATH=$HOME/bin/dev-tools/node/:$PATH
export PATH=$HOME/bin/dev-tools/eagle/bin/:$PATH
export PATH=$HOME/bin/dev-tools/headlessJS/phantomjs/bin/:$PATH
export PATH=$HOME/bin/dev-tools/headlessJS/slimerjs/:$PATH
export PATH=$HOME/bin/dev-tools/headlessJS/casperjs/bin/:$PATH
export PATH=$HOME/bin/dev-tools/Logic/:$PATH
export PATH=$HOME/bin/dev-tools/adt-bundle/sdk/platform-tools:$PATH
export PATH=$HOME/bin/dev-tools/adt-bundle/sdk/tools:$PATH
export PATH=$HOME/bin/dev-tools/cordova/bin:$PATH
export PATH=$HOME/bin/dev-tools/spark-1.3.1/bin:$PATH
export PATH=$HOME/bin/dev-tools/activator/:$PATH
export PATH=$HOME/bin/dev-tools/android-studio/bin/:$PATH
export PATH=$HOME/bin/dev-tools/intelliJ/bin/:$PATH
export PATH=$HOME/bin/dev-tools/pycharm/bin/:$PATH
export PATH=$HOME/bin/dev-tools/clion/bin/:$PATH
export PATH=$HOME/bin/dev-tools/jetty/:$PATH
export PATH=$HOME/bin/dev-tools/jetty/bin/:$PATH
export PATH=$HOME/bin/dev-tools/scala_sloc:$PATH

export PATH=$HOME/bin/games/MultiMC:$PATH
export PATH=$HOME/bin/games/FTL:$PATH

export PATH=$HOME/.cabal:$PATH


#export JAVA_HOME='/usr/lib/jvm/java-1.6.0-openjdk'
export JAVA_HOME='/usr/lib/jvm/java-8-oracle'
export JETTY_HOME="$HOME/bin/dev-tools/jetty/"
export IDEA_JDK='/usr/lib/jvm/java-8-oracle/jre/bin/java'
#export JAVA_HOME='/usr/lib/jvm/java-6-openjdk-amd64/'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/dev/java_libraries/static_libraries/

#export WORKON_HOME=$HOME/Envs
#export PIP_REQUIRE_VIRTUALENV=true
#export PIP_RESPECT_VIRTUALENV=true
#export PIP_VIRTUALENV_BASE=$WORKON_HOME
#source /usr/local/bin/virtualenvwrapper.sh
#source $HOME/bin/dev-tools/nvm/nvm.sh

alias pdipip='/home/beachc/Envs/pdi/bin/pip'
alias notpdipip='/home/beachc/Envs/notpdi/bin/pip'

# TODO: Patch fonts and get powerline-bash/vim working properly
# Powerline bash plugin -------------------------------------------------------
export $TERM=xterm-256color
function _update_ps1()
{
   export PS1="$(~/.bash/PowerLineShell/powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1"

# This was all here when I made this ------------------------------------------ 

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace

HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
