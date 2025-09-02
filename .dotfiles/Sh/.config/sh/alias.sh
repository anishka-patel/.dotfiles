# Editors

alias -- -='cd -'

alias md='mkdir -p'
alias rd=rmdir

alias _="sudo "

alias vi=nvim
alias nv=nvim
alias lv=lvim
alias zv=zvim

if [ -z "$WAYLAND_DISPLAY" ]; then
	alias neovide="neovide"
else
	alias neovide="env -u WAYLAND_DISPLAY neovide"
fi
alias gvi=gvim
alias gnv=neovide
alias code=codium
# Dotfiles
alias dotcfg="/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME"
# Man / Tldr
alias manf="man -k . | awk -F ' - ' '{print \$1}' | fzf --preview 'man {1}' --preview-window=right,70% | xargs man"
alias tldrf="tldr --list | fzf --preview 'tldr {1} --color=always' --preview-window=right,70% | xargs tldr"
alias info="info --vi-keys"
# Utils
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias ls="exa -h --color=auto --group-directories-first"

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"     # confirm before overwriting something
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias more=moar
alias less=moar
alias act=appimage-cli-tool
alias db=distrobox
alias cat=bat
