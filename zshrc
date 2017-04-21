# Path to your oh-my-zsh installation.
export ZSH=/Users/ziv/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-autosuggestions osx extract gitfast colorize)

# User configuration

#== Base ======================================================================
# Export Golang path
export GOPATH=/Users/ziv/coding/go/gopath

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH;"
eval "$(pyenv init -)"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#== History ===================================================================
export HISTSIZE=10000           # Number of history lines kept internally
export SAVEHIST=10000           # Max number of history lines saved
export HISTFILE=~/.zhistory     # History file location


setopt HIST_IGNORE_ALL_DUPS     # Remove all earlier duplicate lines
setopt HIST_FIND_NO_DUPS        # History search finds once only
setopt HIST_IGNORE_SPACE        # Don’t store lines starting with space
setopt EXTENDED_HISTORY         # Save the time and how long a command ran
setopt HIST_NO_STORE            # Not to store history or fc commands

#== Completion ================================================================
setopt COMPLETE_ALIASES         # completion uses unexpanded aliases
setopt COMPLETE_IN_WORD         # allow completion from within a word/phrase
setopt ALWAYS_TO_END            # when completing from the middle of a word, move the cursor to the end of the word


#== cd command ===============================================================
# cd -[TAB] prompt history
setopt AUTO_PUSHD


# Every folder has own history file
cd() {
	builtin cd "$@"                             # do actual cd
	fc -W                                       # write current history  file
	local HISTDIR="$HOME/.zsh_history$PWD"      # use nested folders for history
	if  [ ! -d "$HISTDIR" ] ; then              # create folder if needed
		mkdir -p "$HISTDIR"
	fi
	export HISTFILE="$HISTDIR/zhistory"         # set new history file
	touch $HISTFILE
	local ohistsize=$HISTSIZE
	HISTSIZE=0                                  # Discard previous dir's history
	HISTSIZE=$ohistsize                         # Prepare for new dir's history
	fc -R                                       # read from current histfile
}
mkdir -p $HOME/.zsh_history$PWD
export HISTFILE="$HOME/.zsh_history$PWD/zhistory"



###############################################################################
# Aliases
###############################################################################

# General aliases
alias ll='ls -lth'
alias la='ls -a'
alias json="python -mjson.tool"
alias mysql.server="/usr/local/mysql/support-files/mysql.server"

# Git aliases
alias gitlog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# zsh profile
alias ze='vim ~/.zshrc'
alias zs='source ~/.zshrc'

# vimrc editing
alias ve='vim ~/.vimrc'

# Homebrew
alias brewu='brew update  && brew upgrade --all && brew cleanup && brew prune'

# Get External IP / local IPs
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Quickly serve the current directory as HTTP
alias serve='python -m SimpleHTTPServer'

# tree alias ('tree' will always colorize output)
alias tree='tree -AC --dirsfirst'

# pwd and cd aliases
# alias .='pwd'
# alias ..='cd ..'
# alias ...='cd ../..'


###############################################################################
# Functions
###############################################################################

# Delete '*.pyc' files
function delpyc {
    find . -type d -name '__pycache__' | sed 's#^\./##' | while read d; do echo $d; rm -rf $d; done
    find . -type f -name '*.pyc' | sed 's#^\./##' | while read f; do echo $f; rm -f $f; done
}

function allhistory { 
    cat $(find $HOME/.zsh_history -name zhistory) 
}

function convhistory {
    sort $1 | uniq |
    sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |
    awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print }'
}

