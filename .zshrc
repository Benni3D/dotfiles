# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#DISABLE_AUTO_TITLE=true

# Use powerline
USE_POWERLINE="true"
source ~/.config/zsh/manjaro-zsh-config
source ~/.config/zsh/manjaro-zsh-prompt
bindkey -v

export EDITOR='nvim'
export PRINTER='HP_ENVY_4520_series'
export EIX_LIMIT=0
export PATH="$HOME/.local/bin:$PATH:/opt/cross/bin:$HOME/.emacs.d/bin"
export QT_QPA_PLATFORMTHEME=qt5ct

alias man='LC_ALL=POSIX man'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias e="$EDITOR"
alias ez="$EDITOR ~/.zshrc"
alias er="$EDITOR -R"
alias se="sudo $EDITOR"
alias t='mkdir -p /tmp/benni/test && pushd /tmp/benni/test'
alias untar='tar -xf'
alias dmesg='sudo dmesg --color=always | less'
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias tldr="LANG=C tldr"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias genpw='openssl rand -base64 32'

unsetopt autocd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.config/zsh/p10k.zsh


function zle-keymap-select {
   if [[ ${KEYMAP} == vicmd ]]; then
      echo -ne '\e[1 q'
   elif [[ ${KEYMAP} == main ]]  ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} == '' ]]    ||
        [[ $1 = 'beam' ]]; then
      echo -ne '\e[5 q'
   fi
}

zle -N zle-keymap-select
echo -ne '\e[5 q'

_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

#preexec() {
#   title "$1"
#}

#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
#autoload -Uz compinit && compinit

export QSYS_ROOTDIR="/mnt/src/quartus/quartus/sopc_builder/bin"
