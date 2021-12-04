stty -ixon

# export PATH="$PATH:/opt/riscv/bin:/opt/riscv64/bin"
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
export HISTSIZE=
export HISTFILESIZE=
export HISTCONTROL=ignoreboth
export HISTFILE=~/.local/share/bash/history

alias e='nvim'
alias se='sudo nvim'
alias man='LC_ALL=POSIX man'

alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias untar='tar -xf'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

alias dmesg='sudo dmesg --color=always | less'
alias t='mkdir -p /tmp/benni/test && cd /tmp/benni/test'

shopt -s direxpand

# set -o vi

export EIX_LIMIT=0

