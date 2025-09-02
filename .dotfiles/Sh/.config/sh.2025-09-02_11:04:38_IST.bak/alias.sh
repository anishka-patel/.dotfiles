# Editors
alias vi=vim
alias nv=nvim
if [ -z "$WAYLAND_DISPLAY" ]; then
  alias neovide="neovide"
  alias leovide="neovide --neovim-bin \$HOME/.local/bin/lvim"
else
  alias neovide="env -u WAYLAND_DISPLAY neovide"
  alias leovide="env -u WAYLAND_DISPLAY neovide --neovim-bin \$HOME/.local/bin/lvim"
fi
alias gnv=neovide
alias lv=lvim
alias glv=leovide
alias es=emacs
alias ec="emacsclient -ta ''"
alias gec="emacsclient -cnqua ''"
alias ka=kate
alias kw=kwrite
alias code=codium
# Dotfiles
alias dotcfg="/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME"
# Man / Tldr
alias manf="man -k . | awk -F ' -' '{print \$1}' | fzf --preview 'man {1}' --preview-window=right,70% | xargs man"
alias tldrf="tldr --list | fzf --preview 'tldr {1} --color=always' --preview-window=right,70% | xargs tldr"
# Utils
alias ls="ls -h --color=auto --group-directories-first"
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"     # confirm before overwriting something
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias more=moar
alias less=moar
alias act=appimage-cli-tool
