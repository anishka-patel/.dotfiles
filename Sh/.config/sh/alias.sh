alias -- -='cd -'

alias md='mkdir -p'
alias rd=rmdir

alias _="sudo "

if command -v nvim >/dev/null; then
	alias nv="NVIM_APPNAME=nv nvim"
    alias vi=nv
    alias vim=nvim
else
	alias vi=vim
fi

if [ -d "$HOME/.config/lazyvim" ]; then
	alias lvim="NVIM_APPNAME=lazyvim nvim"
	alias lv="NVIM_APPNAME=lazyvim nvim"
fi

if command -v emacs >/dev/null; then
	alias es="emacs -nw"
	alias ec="emacsclient -tqua ''"
	alias ges="launch emacs"
	alias gec="launch emacsclient -cqua ''"
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

if command -v lsd >/dev/null; then
	alias ls="lsd -h --color=auto --group-directories-first"
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

if command -v moar >/dev/null; then
	alias more=moar
	alias less=moar
fi
if command -v distrobox >/dev/null; then
	alias db=distrobox
fi

if command -v bat >/dev/null; then
	alias cat="bat --theme Dracula"
fi

if command -v fastfetch >/dev/null; then
	alias ff=fastfetch
fi
alias datef="date -u +%a,\ %Y-%b-%d"
alias datetimef="date -u +%a,\ %Y-%b-%d%n%H:%M\ \(%Z\)"
alias wget="wget -c -T 60"
