alias -- -='cd -'

alias md='mkdir -p'
alias rd=rmdir

alias _="sudo"

if command -v nvim >/dev/null; then
  alias vi=nvim
  alias vim=nvim
fi

if [ -d "$HOME/.config/lazyvim" ]; then
  alias lvim="NVIM_APPNAME=lazyvim nvim"
  alias lv="NVIM_APPNAME=lazyvim nvim"
fi

if command -v emacs >/dev/null; then
  alias es="emacs -nw"
  alias ec="emacsclient -ta ''"
fi

if command -v neovide >/dev/null; then
  if [ "$WAYLAND_DISPLAY" = "" ]; then
    alias neovide="neovide"
  else
    alias neovide="env -u WAYLAND_DISPLAY neovide"
  fi
  alias gnv=neovide
fi

if command -v gvim >/dev/null; then
  alias gvi=gvim
fi

alias info="info --vi-keys"
# Utils
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

if command -v eza >/dev/null; then
  alias ls="eza --color=auto --group-directories-first --icons=always"
elif command -v lsd >/dev/null; then
  alias ls="lsd --color=auto --group-directories-first"
fi

if command -v lazygit >/dev/null; then
  alias lg=lazygit
  alias lgit=lazygit
fi

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"     # confirm before overwriting something
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

if command -v moor >/dev/null; then
  alias more=moor
  alias less=moor
fi

if command -v bat >/dev/null; then
  alias bat="bat --theme Dracula --pager never"
  alias cat="bat --theme Dracula --pager never"
fi

if command -v fastfetch >/dev/null; then
  if [ -f /usr/bin/fastfetch ]; then
    alias fastfetch="/usr/bin/fastfetch"
  fi
  alias ff=fastfetch
fi

if command -v distrobox >/dev/null; then
  alias db=distrobox
  alias hostexec="distrobox-host-exec"
fi

# alias which="which -a"
alias datef="date -u +%a,\ %Y-%b-%d"
alias datetimef="date -u +%a,\ %Y-%b-%d%n%H:%M\ \(%Z\)"
alias wget="wget -c -T 60"
alias mv="mv -i"
alias mkdir="mkdir -p"
if command -v trash >/dev/null; then
  alias rm="trash"
else
  alias rm="rm -i"
fi
