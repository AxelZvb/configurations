# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


PS1='[\u@\h \w]\$ '

alias psa='ps auxww | grep axezev'

# stm32f aliases
alias stlink='~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32CubeProgrammer &'

# Mod bashrc
alias vcfg='vim ~/.bashrc'
alias lcfg='source ~/.bashrc'

# Remotes
alias rlnxdev02='remmina -c /home/axezev/.local/share/remmina/1547116239350.remmina &'
alias rrds02='remmina -c /home/axezev/.local/share/remmina/1547115843693.remmina&'

# VIM
alias vide='~/bin/vim -u ~/vimiderc'
alias vin='~/bin/vim'
alias vcl='find . -type f -name ".*.swp" -exec rm -f {} \;'

# Basic functionality
alias neon='eclipse --launcher.suppressErrors -quiet &> /dev/null&'
alias mars='eclipse-mars --launcher.suppressErrors -quiet &> /dev/null&'

# Git shortcuts
alias gits='git status'
alias gitp='git push'
alias gitc='git commit'
alias gitb='git branch'
alias gitpu='git pull -r'
alias git_push_lease='git push --force-with-lease'
alias git_get_all_branches='for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done'
alias git_prune='git remote prune origin'
alias git_rm_last_commit='git reset HEAD~1'

gitch () {
    git checkout "$1"
}

# Make assists
alias mcm='make clean && make'

#Debugger
alias dcocd='cd openocd/0.10.0-201601101000-dev/bin/'
alias lsstl='/data/projects/hyster-yale/stlink/st-info --probe hla_serial'

# start python
alias py3='python3'
alias py2='python2'

#coppydrive
alias cpaz='cd ~/copydrive/axezev'
alias mkcpaz='mkdir ~/copydrive/axezev'

# Aliases for the CDM project
alias cdm='cd /data/projects/thermo-king/cdm/axezev/work'

# Aliases for the PCU project
alias pcu='cd /data/projects/thermo-king/pcu/axezev/work/ac'

# Aliases for the GATCON project
alias gatcon='cd ~/repos/GATCON/gatcon_ac'
alias gatiot='cd ~/repos/GATCON/gatcon_ac/iot_stm'
alias gatacq='cd ~/repos/GATCON/gatcon_ac/AC_qualification'
alias iot='cd ~/repos/IOT/iot_stm32/'
alias iotdoc='cd ~/repos/IOT/iot_stm32/documentation'

# Aliases for the YH_PROBLEM project
alias yh_p='cd /data/projects/thermo-king/gatcon/axezev/temp/grm2g'
alias grm='cd /data/projects/jungheinrich/axezev/'

# Function to start the terminal
tm () {
	tee /dev/stderr | microcom -p /dev/serial/by-id/"$1" -s "$2"
}
tm_f () {
        tee /dev/stderr | microcom -p /dev/serial/by-id/"$1" -s "$2" -f
}

#test -f ~/.git-completion.bash && . $_
source ~/git-completion.bash

alias get_tm='ls /dev/serial/by-id/'
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$PATH:/home/axezev/.local/usr/local/bin"
export PATH="$PATH:/home/axezev/.local/bin"
export PATH="$PATH:/home/axezev/repos/buildtools/bazel-bin/buildifier/linux_amd64_stripped"


format() {
	find $1 -type f -name '*.[ch]' | while read file; do clang-format-6.0 $file > x && mv x $file; done
}

alias gen_db='compiledb make'

# calculation aliasses
bcc() {
	# echo "obase=16; 64" | bc
	echo "$*" | bc
}

# mounts
alias mntprojects="sshfs -o nonempty,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 $USER@lnxdev02:projects/ ~/projects"
alias mntcopydrive="sshfs -o nonempty,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 $USER@lnxdev02:/mnt/pd-common/copydrive ~/copydrive"
alias umntprojects="sudo umount ~/projects"
alias umntcopydrive="sudo umount ~/copydrive"

# VPN
alias pdvpn='sudo openconnect --juniper vpn.prodrive.nl/linux --certificate=/home/$USER/$USER.crt --sslkey=/home/$USER/$USER.key'

# Screen configuration aliases
alias wdisp='~/.screenlayout/work_setup.sh'
alias ldisp='~/.screenlayout/no-disps.sh'
alias lddisp='~/.screenlayout/no-disps-dimm.sh'

export PATH="$PATH:$HOME/bin"

# BAZEL
source /home/axezev/.bazel/bin/bazel-complete.bash

alias biot='bazel build --crosstool_top=//toolchain --cpu=arm-none-eabi :stm32'
alias biotut='bazel build :UT'

# I3 functions
i3_sw() {
	i3-msg "rename workspace $1 to temporary; rename workspace $2 to $1; rename workspace temporary to $2"	
}

i3_mv() {
	i3-msg "rename workspace $1 to $2;"
}

# Post action steps
gsettings set org.gnome.Vino require-encryption false

# BASH commands
alias rm='trash'
alias rmr='rm'
setx() {
    chmod +x $1
}

# QT

alias qt='sudo ~/Qt/Tools/QtCreator/bin/qtcreator'
alias guidcdc='cd ~/Qt_projects/DCDC/dcdc_gui'
alias guigat='cd ~/Qt_projects/GATCON/'
alias guipcu='cd ~/Qt_projects/PCU/'
alias guicdm='cd ~/Qt_projects/CDM/'


alias calc='speedcrunch'
