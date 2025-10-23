# ~/.zprofile — login shell setup

# Load secrets
[ -f "$HOME/.zshrc_env" ] && source "$HOME/.zshrc_env"

# PATH adjustments
export PATH="$HOME/.local/bin:$PATH"

# Ripgrep config
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# FZF environment defaults
export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --strip-cwd-prefix  "
show_file_or_dir_preview="if [ -d {} ]; then eza -T --color=always {} | head -200; else bat --theme auto:system --theme-dark gruvbox-dark --theme-light gruvbox-light -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS=" --preview 'tree   -C {} -I \".pyc|__pycache__|node_modules|.venv\" '"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_DEFAULT_OPTS="
--layout=reverse
--no-border
--preview-window=hidden:border-none
--info=inline
--height=80%
--preview 'bat --theme auto:system --theme-dark gruvbox-dark --theme-light gruvbox-light --style=numbers --color=always {}'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
--bind 'ctrl-v:execute(code {+})'
--color=bg+:-1,bg:-1,spinner:#7a8aa6,hl:#d8a16c \
--color=fg:#dddddd,header:#d8a16c,info:#83adc3,pointer:#c88a77 \
--color=marker:#c88a77,fg+:#c7c7c7,prompt:#83adc3,hl+:#d8a16c \
--color=border:-1 \
--multi"




# Jellybeans
# "--color=bg+:-1,bg:-1,spinner:#ffafaf,hl:#ff8700 \
# --color=fg:#dddddd,header:#ffaf5f,info:#ff8700,pointer:#ffafaf \
# --color=marker:#ff5f87,fg+:#c6b6ee,prompt:#ff8700,hl+:#ff8700 \
# --color=border:-1 \
# --multi"

# Jellybeans Muted
# " \
# --color=bg+:#101010,bg:#101010,spinner:#7a8aa6,hl:#d8a16c \
# --color=fg:#dddddd,header:#d8a16c,info:#83adc3,pointer:#c88a77 \
# --color=marker:#c88a77,fg+:#c7c7c7,prompt:#83adc3,hl+:#d8a16c \
# --color=border:#101010 \
# --multi"


# NVM setup (only at login)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"



# uv & uvx completions
# "$HOME/.local/bin/env" 
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
