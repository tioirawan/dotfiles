# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

echo "setting oh-my-zsh path"
# Path to your oh-my-zsh installation.
  export ZSH=/home/indmind/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
echo "setting zsh theme"
ZSH_THEME="sunset"

echo "setting zsh config"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
echo "loading plugin"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# My Alias

echo "setting aliases"

alias winproj="cd /media/indmind/Data/Project"
alias cekinet="sudo iftop -i wlp3s0"
alias fixwin="sudo ntfsfix /dev/sda5"
#alias processing="sh '/home/indmind/processing-3.3.6/processing'"
alias cmdrating="history | awk '{CMD[\$2]++;count++;} END { for (a in CMD) print CMD[a] \" \" CMD[a] / count * 100 \"% \" a;}' | grep -v "./" | column -c3 -s \" \" -t | sort -nr | nl | head -n10"
alias cgb="git branch | grep -v \"master\" | xargs git branch -D "
# alias naomi="~/projects/shell/enc.sh"
alias hackel="docker run -it -e DISPLAY=$DISPLAY --net=\"host\" -w /root --privileged kali /bin/bash"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias spdl="python3 ~/Projects/not\ me/spotify-downloader/spotdl.py -f ~/Music/SpotifyDl"
alias open='xdg-open &>/dev/null'

# zsh autosuggestion

echo "enabling zsh auto suggestion"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
#AUTOSUGGESTION_HIGHLIGHT_COLOR="fg=240,bold"

# Path Settings

echo "exporting home bin path"
export PATH="$PATH:$HOME/bin"

echo "exoporting nvm path"
export NVM_DIR="$HOME/.nvm"
echo "loading nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
echo "loading nvm bash completion"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "exporting metasploit framework path"
export PATH="$PATH:/opt/framework/metasploit-framework"
echo "create msfconsole alias"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""

echo "exporting godot path"
export PATH="$PATH:/opt/Godot"

echo "exporting composer bin path"
export PATH="$PATH:$HOME/.composer/vendor/bin"

echo "exporting pyenv path"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

echo "exporting ruby path"
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

echo "load rvm scripts"
source ~/.rvm/scripts/rvm

echo "load zsh command not found"
# suggestion on command not found
[ -f /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found

echo "init pyenv"
# init pyenv
if command -v pyenv 1>/dev/null 2>&1;
then
    eval "$(pyenv init -)"
fi

figlet DONE!
sleep .3
clear
