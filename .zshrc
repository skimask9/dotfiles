# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Load secret env variables
if [ -f "$HOME/.zshrc_env" ]; then
  source "$HOME/.zshrc_env"
fi

# Ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.rgrc

# export FZF_CTRL_T_COMMAND
export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --strip-cwd-prefix  "
# export FZF_ALT_C_OPTS=" --preview 'tree -I '__pycache__|node_modules|'"
# export FZF_ALT_C_OPTS=" --preview 'tree -I \"*.pyc|__pycache__|node_modules\"' "
show_file_or_dir_preview="if [ -d {} ]; then eza -T --color=always {} | head -200; else bat --theme auto:system --theme-dark gruvbox-dark --theme-light gruvbox-light -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS=" --preview 'tree   -C {} -I \".pyc|__pycache__|node_modules|.venv\" '"
# export FZF_CTRL_T_OPTS="
#   --preview 'batcat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_DEFAULT_OPTS="
--layout=reverse
--border=rounded 
--preview-window=border-rounded
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview 'bat --theme auto:system --theme-dark gruvbox-dark --theme-light gruvbox-light --style=numbers --color=always {}'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
--bind 'ctrl-v:execute(code {+})'
--color=bg+:#202020,bg:-1,spinner:#ffafaf,hl:#ff8700 \
--color=fg:white,header:#ffaf5f,info:#ff8700,pointer:#ffafaf \
--color=marker:#ff5f87,fg+:#c6b6ee,prompt:#ff8700,hl+:#ff8700 \
--color=border:#151515"
# my custom fzf colors
# --color=bg+:#1c1c1c,bg:#151515,spinner:#a0a8b0,hl:#b39066 \
# --color=fg:#dddddd,header:#b39066,info:#7a8aa6,pointer:#a0a8b0 \
# --color=marker:#a08070,fg+:#c7c7c7,prompt:#7a8aa6,hl+:#b39066 \
# --color=border:#151515 \
# --multi
# tokyonight
# --color=fg:#c0caf5,bg:-1,hl:#ff9e64 \
# --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64,gutter:#292e42 \
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
# --border --color border:-1,preview-border:#c0caf5,preview-bg:-1,preview-fg:#c0caf5"
# some test
# --border --color border:#c0caf5,preview-border:#c0caf5,preview-bg:-1,preview-fg:#c0caf5"
### EVERFOREST MAIN
# --color fg:#606364,bg:#272e33
# --color bg+:#8dae88,fg+:#475258,hl:#d4be98,hl+:#26292a,gutter:#404344
# --color pointer:#404344,prompt:#df736d,info:#606364,spinner:#98C379
# --border --color border:#222526,preview-border:#282b2c,preview-bg:#222526,preview-fg:#d4be98

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
plugins=(git pip z fzf-tab docker zsh-autosuggestions
    zsh-completions 
    zsh-history-substring-search 
    zsh-syntax-highlighting)

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
# setopt hist_expire_dups_first
# setopt hist_ignore_dups
# setopt hist_verify
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
# alias ls="exa -G -F --color=always --icons -a"
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



#fzf-tab
# disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
# zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:*' popup-min-size 80 10
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':fzf-tab:*' fzf-flags $(echo $FZF_DEFAULT_OPTS)
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -G -G -a -T -1 --color=always $realpath'
# switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# [ -f ~/.fzf.zsh ] && ssource <(fzf --zsh)ource ~/.fzf.zsh
source <(fzf --zsh)
# autoload -Uz compinit
zstyle ':completion:*' menu select


source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
export PATH="$HOME/.local/bin:$PATH"
