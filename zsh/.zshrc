# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initailization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# Optionally load login settings for non-login interactive shells
[ -f ~/.zprofile ] && source ~/.zprofile

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.rgrc


# Preferred Python version management tool: uv
# only-system: Only use system Python (Homebrew), never download managed versions
# system: Prefer system Python, but fall back to managed versions if needed
# UV_PYTHON_PREFERENCE=system. This gives you the best of both worlds—it will prefer your Homebrew Python but can still fall back to uv-managed Python if needed for specific versions.
export UV_PYTHON_PREFERENCE=system


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z fzf-tab docker zsh-autosuggestions zsh-completions fast-syntax-highlighting)

# zsh-history-substring-search
autoload -U compinit && compinit
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
source $ZSH/oh-my-zsh.sh




# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='eza -G -F --color=always --icons -a'
alias tree="tree -I '*.pyc|__pycache__|node_modules'"
alias lsa="eza --icons -a"
alias rn="./manage.py runserver"
alias rn5="./manage.py runserver 5000"
alias uvi='uvicorn_with_reload() { uvicorn "$1":app --reload; }; uvicorn_with_reload'
alias fa="fastapi dev main.py"
alias ven="source .venv/bin/activate"
alias venv='venv_name() { source "$1"/bin/activate; }; venv_name'
alias lss="eza --color=always --long --git --no-filesize --icons=always  --no-time --no-user --no-permissions"
alias nv='nvim'
alias gdf='git difftool --tool=nvimdiff'
alias anv="NVIM_APPNAME=lazy_nvim nvim"
alias nvc='nvim --clean'
# alias pbcopy="xclip -selection clipboard"
alias tm="tmux"
alias tma="tmux attach"
alias ven='source .venv/bin/activate'
alias nv='nvim'
alias bat="bat --theme auto:system --theme-dark gruvbox-dark --theme-light gruvbox-light"
# like normal z when used with arguments but displays an fzf prompt when used without.
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && zshz "$*" && return
    cd "$(zshz -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
# find-in-file - usage: fif <SEARCH_TERM>
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  rg --files-with-matches --no-messages "$1" | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}


# Pomodoro
function work () {
  timer 25m --format 24h -n WORK
  osascript -e 'display notification "Pomodoro" with title "Work Timer is up! Take a Break 😊" sound name "Crystal"'
  osascript -e 'say "Work timer is up! Take a break"'
}

function rest () {
  timer 10m --format 24h -n REST
  osascript -e 'display notification "Pomodoro" with title "Break is over! Get back to work 😬" sound name "Crystal"'
  osascript -e 'say "Break is over. Get back to work"'
}

function pomodoro () {
  # Usage: pomodoro [cycles]
  # Example: pomodoro 4   → runs 4 work/break cycles
  #          pomodoro     → runs forever

  local max_cycles=$1
  local count=0

  # Make log directory
  local log_dir="$HOME/pomodoro"
  mkdir -p "$log_dir"

  while true; do
    ((count++))

    local start_time=$(date +"%H:%M:%S")
    local date=$(date +"%Y-%m-%d")

    # Work phase
    timer 25m --format 24h -n WORK
    osascript -e 'display notification "Work Timer is up! Take a Break 😊" with title "Pomodoro"'
    say "Work timer is up! Take a break"

    local work_end=$(date +"%H:%M:%S")

    # Rest phase
    timer 5m --format 24h -n REST
    osascript -e 'display notification "Break is over! Get back to work 😬" with title "Pomodoro"'
    say "Break is over. Get back to work"

    local rest_end=$(date +"%H:%M:%S")

    # Log into daily file
    local log_file="$log_dir/$date.md"
    {
      echo "## Cycle $count"
      echo "- Start: $start_time"
      echo "- Work ended: $work_end"
      echo "- Break ended: $rest_end"
      echo
    } >> "$log_file"

    # Stop if max cycles reached
    if [[ -n "$max_cycles" && $count -ge $max_cycles ]]; then
      echo "✅ Completed $count pomodoro cycles"
      break
    fi
  done
}
#killing process (ports) using fzf
function fkill() {
  lsof -i -P -n | fzf -m | awk '{print $2}' | xargs -r kill -9
}

#fzf-tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:*' popup-min-size 80 10
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -G -G -a -T -1 --color=always $realpath'

# [ -f ~/.fzf.zsh ] && ssource <(fzf --zsh)ource ~/.fzf.zsh
source <(fzf --zsh)
# autoload -Uz compinit
zstyle ':completion:*' menu select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
