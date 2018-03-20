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
[ -r /home/indmind/.byobu/prompt ] && . /home/indmind/.byobu/prompt   #byobu-prompt#

#tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# user defined

alias sudo="sudo "
alias winproj="cd /media/indmind/Data/Project"
alias cekinet="sudo iftop -i wlp3s0"
alias fixwin="sudo ntfsfix /dev/sda5"
#alias processing="sh '/home/indmind/processing-3.3.6/processing'"
alias cmdrating="history | awk '{CMD[\$2]++;count++;} END { for (a in CMD) print CMD[a] \" \" CMD[a] / count * 100 \"% \" a;}' | grep -v "./" | column -c3 -s \" \" -t | sort -nr | nl | head -n10"
alias cgb="git branch | grep -v \"master\" | xargs git branch -D "
# alias naomi="~/projects/shell/enc.sh"
alias hackel="docker run -it -e DISPLAY=$DISPLAY --net=\"host\" --privileged kali /bin/bash"

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Linuxbrew profile/bashrc example
#
# --- [ Recommended ] ---
## for elf executables
export PATH="${HOME}/.linuxbrew/bin:${PATH}"
#
## for manpages
export MANPATH="${HOME}/.linuxbrew/share/man:${MANPATH}"
#
## for info pages
export INFOPATH="${HOME}/.linuxbrew/share/info:${INFOPATH}"
#

# $PS1

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		printf "\e[32mon \e[92mbranch \e[36m${BRANCH} ${STAT}"
	else
		printf ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=" \e[94mRenamed${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits=" \e[36mAhead${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits=" \e[33mNewfile${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits=" \e[33mUntracked${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits=" \e[31mDeleted${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits=" \e[95mModified${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		printf "\e[32mwith \e[92mstatus:${bits}"
	else
		printf ""
	fi
}

export PATH="$PATH:$HOME/.rvm/bin" 
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

export PS1='$(if [ $? = 0 ]; then echo "\[\033[01;32m\]✔\[\e[m\]"; else echo "\[\033[01;31m\]✘\[\e[m\]"; fi)\[\e[32m\] as \[\e[m\]\[\e[1;94m\]\u\[\e[m\]\[\e[32m\] at \[\e[m\]\[\e[1;35m\]\h\[\e[m\]\[\e[32m\] in \[\e[m\]\[\e[1;36m\]\w \[\e[m\]$(parse_git_branch)\n\[\e[00m\]\$ '
export PS2='>'

# Metasploit
export PATH=$PATH:/opt/framework/metasploit-framework
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

# Add composer bin to PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source ~/.rvm/scripts/rvm
