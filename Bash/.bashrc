#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

datefmt() {
	date +'%Y-%m-%d_%H:%M:%S_%Z'
}

cp2bk() {
    for i in $@; do
        cp -r "$i" "$i.$(datefmt).bak"
    done
}

sudocp2bk() {
    for i in $@; do
        sudo cp -r "$i" "$i.$(datefmt).bak"
    done
}

mv2bk() {
    for i in $@; do
        mv "$i" "$i.$(datefmt).bak"
    done
}

sudomv2bk() {
    for i in $@; do
        sudo mv "$i" "$i.$(datefmt).bak"
    done
}

bked() {
    for i in $@; do
        cp "$i" "$i.$(datefmt).bak"
    done
    nvim "$@"
}

edit() {
    $EDITOR "$@"
}

sudobked() {
    for i in $@; do
        sudo cp "$i" "$i.$(datefmt).bak"
    done
	sudoedit "$@"
}

sesh-sessions() {
	{
		exec </dev/tty
		exec <&1
		local session
		session=$(sesh list -t -c | fzf --height 40% \
			--reverse \
			--border-label ' sesh ' \
			--border --prompt '⚡  ')
		[[ -z "$session" ]] && return
		sesh connect "$session"
	}
}
sesh-connect() {
	{
		exec </dev/tty
		exec <&1
		sesh connect "$(sesh list | fzf)"
	}
}
launch() {
	echo "$@"
	"$@" >/dev/null 2>&1 &
	disown
}

bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind 'TAB:menu-complete'
bind "set colored-completion-prefix on"
bind "set colored-stats on"

shopt -s autocd
shopt -s expand_aliases
shopt -s histappend

alias ls='lsd -a --date=relative \
      --truncate-owner-after 4 \
      --truncate-owner-marker "..." \
      --group-directories-first'
alias l='ls -lh'
alias grep='grep --color=auto'
alias es="emacs -nw"
alias ec="emacsclient -ta 'emacs'"
alias vi=vim
alias nv=nvim
alias lg=lazygit
alias lgit=lazygit
alias ges="launch emacs"
alias gec="launch emacsclient -ca 'emacs'"
alias gnv="launch neovide"

alias more="moar"
alias less="moar"
alias bat="bat --theme Dracula"
alias cat="bat"
alias cp="cp -i"
alias df="df -h"
alias free="free -m"

alias -- -="cd -"

# export EDITOR="emacsclient -ta 'emacs'"
# export VISUAL="emacsclient -ca 'emacs'"
export EDITOR="nvim"
export VISUAL="nvim"
export HISTSIZE=10000
export HISTFILESIZE=10000

[ -f "/usr/share/fzf/completion.bash" ] &&
	source "/usr/share/fzf/completion.bash"
[ -f "/usr/share/fzf/key-bindings.bash" ] &&
	source "/usr/share/fzf/key-bindings.bash"
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
	. /usr/share/bash-completion/bash_completion

eval "$(starship init bash)"
eval "$(zoxide init bash)"
fastfetch

bind -x '"\es":"sesh-sessions"'
bind -x '"\et":"sesh-connect"'
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"
