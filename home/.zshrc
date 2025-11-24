# =========================
# PATH and environment
# =========================
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
export PATH="$PATH:$HOME/go/bin:/opt/kafka/bin:$HOME/.config/rofi/scripts:$HOME/.cargo/bin:${KREW_ROOT:-$HOME/.krew}/bin"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export EDITOR=/bin/nvim

# =========================
# Zinit bootstrap
# =========================
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# =========================
# Zinit plugins
# =========================
# Core plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light romkatv/gitstatus

# OMZP snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::terraform

# Optional program-only plugin
zinit ice lucid as"program" pick"bin/git-dsf"
zinit load so-fancy/diff-so-fancy

# =========================
# Completion setup
# =========================
autoload -Uz compinit && compinit
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Completion styling
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab configuration
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

export FZF_TMUX=1

# =========================
# Keybindings
# =========================
bindkey -v
bindkey '^[ '   autosuggest-execute
bindkey '^[Z '  autosuggest-accept
bindkey '^p'    history-search-backward
bindkey '^n'    history-search-forward
bindkey '^[w'   kill-region

# Vim-style cursor
autoload -U add-zsh-hook
zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]]; then
    print -n "\e[1 q"  # block cursor
  else
    print -n "\e[5 q"  # beam cursor
  fi
}
add-zsh-hook keymap-select zle-keymap-select

# =========================
# History configuration
# =========================
HISTSIZE=5001
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# =========================
# Tool initialization
# =========================
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
eval "$(starship init zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
complete -C '/usr/bin/aws_completer' aws

# =========================
# Aliases
# =========================
alias vim='nvim'
alias v='nvim .'
alias kls='kubectl get all'
alias jump='nvim $(fzf -m --preview="bat --color=always {}")'
alias ls='eza -l --icons --level=1 --tree --sort=Name'
alias search='eval "~/.local/bin/search.sh"'
alias ff='fastfetch'
alias lg='lazygit'

alias t='tmux new -s '
alias tt='tmux a -t'
alias fbat="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias seek='pacseek'
alias y='yazi'
alias ci='cdi'

alias ....='cd ../..'
alias ..='cd ..'
alias ~='cd ~'

alias p='cd ~/p'
alias w='cd ~/w'

alias todo='~/.todo/todo_tui.sh'
alias todocli='~/.todo/todo_cli.sh'

# =========================
# Functions
# =========================
open() {
    local PROJECT_DIR SESSION_NAME
    PROJECT_DIR="${1:-.}"
    SESSION_NAME=$(basename "$PROJECT_DIR")
    code "$PROJECT_DIR"
    cd "$PROJECT_DIR" || return
    
    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
        tmux attach-session -t "$SESSION_NAME"
    else
        tmux new-session -d -s "$SESSION_NAME" -n main -c "$PROJECT_DIR"
        for i in {1..4}; do
            tmux new-window -t "$SESSION_NAME":$i -n "worker$i" -c "$PROJECT_DIR"
        done
        tmux select-window -t "$SESSION_NAME":1
        tmux attach-session -t "$SESSION_NAME"
    fi
}

gh-create() { git init && gh repo create --private --source=. --remote=origin && git push -u --all && gh browse; }

add() { git add --patch; }

commit() { bash ~/work/main/dotsh/gh/commit; }

push() { git push; }

tag() { git tag "$1"; git push origin "$1"; }

clear-local-branches() { git branch --merged dev | grep -v '\*' | grep -v dev | xargs git branch -d; }

wall() { gowall convert ~/Pictures/Wallpaper/$1 -t mocha; }

ms() { touch "$1" && chmod +x "$1"; }

gh-visibility() { gh repo edit --accept-visibility-change-consequences --visibility "$1"; }

edit() { code ~/.config/$1; }

cpcf() {
    local file
    file=$(fzf --query="$1" --preview 'bat --color=always {}' --preview-window 'right:60%' --bind 'ctrl-d:preview-page-down,ctrl-u:preview-page-up')
    [[ -n "$file" ]] && cat "$file" | wl-copy && echo "Copied: $file" || echo "No file selected."
}

mount_gdrive() { rclone mount gdrive: ~/mnt/gdrive; }

gh_open() { xdg-open "https://github.com/ad1822/$(basename $(pwd))"; }

backup_dots() { exec syncAll.sh; }

fcd() { local dir; dir=$(find ${1:-.} -type d -not -path '*/\.*' 2>/dev/null | fzf +m) && cd "$dir"; }

extract() { [ -f "$1" ] && case "$1" in *.tar.gz) tar -xzf "$1";; *.tar.xz) tar -xf "$1";; *.tar.bz2) tar -xjf "$1";; *.gz) gunzip "$1";; *.bz2) bunzip2 "$1";; *.zip) unzip "$1";; *.Z) uncompress "$1";; *.7z) 7z x "$1";; *) echo "'$1' cannot be extracted";; esac || echo "'$1' is not a valid file"; }

killp() { ps aux | fzf | awk '{print $2}' | xargs kill -9; }

j() { local dir; dir=$(eza -1 --color=always --icons --group-directories-first | fzf --ansi) && cd "$(echo "$dir" | awk '{print $NF}')"; }

take() { mkdir -p "$1" && cd "$1"; }

c() { cd "$1" && ls; }

# =========================
# Sartup
# =========================

clear;
ff;
