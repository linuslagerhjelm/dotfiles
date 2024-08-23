# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  git
  jsontools
  zsh-autosuggestions
  docker
  kubectl
  podman
  zsh-syntax-highlight
  zsh-npm-scripts-autocomplete
)

source $ZSH/oh-my-zsh.sh

# Variables

# Alias
alias router="netstat -rn | grep default"
alias ip="ifconfig | grep \"inet \" | grep -v \"127.0.0.1\" | awk '{print $2}'"
alias dir="ls"
alias whatsmyip="curl 'https://api.ipify.org'"
alias gradlew="./gradlew"
alias cls="clear"
alias uuid="python3 -c 'import uuid; print(uuid.uuid4())'"
alias ls="ls -1F --color"

# Functions
## System
function preexec() {
  timer=$(($(gdate +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(gdate +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    if [ $elapsed -ge 60000 ]; then
      # Calculate minutes and remaining seconds
      elapsed_minutes=$(($elapsed/60000))
      remaining_seconds=$(($elapsed%60000/1000))
      export RPROMPT="%F{cyan}${elapsed_minutes}m${remaining_seconds}s %{$reset_color%}"
    elif [ $elapsed -ge 1000 ]; then
      # Convert milliseconds to seconds
      elapsed_seconds=$(($elapsed/1000))
      export RPROMPT="%F{cyan}${elapsed_seconds}s %{$reset_color%}"
    else
      export RPROMPT="%F{cyan}${elapsed}ms %{$reset_color%}"
    fi

    unset timer
  fi
}

## Invokable
gitig() {
  for arg in "$@"
  do
    echo "$arg" >> .gitignore
  done
}

rand() {
  if [ "$#" -eq "0" ]
    then
      openssl rand -hex 10;
    else
      openssl rand -hex $1;
  fi
}

qr() {
  curl "qrcode.show/$0"
}

