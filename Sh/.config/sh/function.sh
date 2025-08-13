cp2bk() {
    for i in "$@"; do
        cp -r "$i" "$i.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
    done
}

sudocp2bk() {
    for i in "$@"; do
        sudo cp -r "$i" "$i.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
    done
}

mv2bk() {
    for i in "$@"; do
        mv "$i" "$i.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
    done
}

sudomv2bk() {
    for i in "$@"; do
        sudo mv "$i" "$i.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
    done
}

bked() {
    for i in "$@"; do
        cp "$i" "$i.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
    done
	nvim "$@"
}

sudobked() {
    for i in "$@"; do
        sudo cp "$i" "$i.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
    done
	sudoedit "$@"
}

sesh-sessions() {
	{
		exec </dev/tty
		exec <&1
		local session
		session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
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
	"$@" >/dev/null 2>&1 &
	disown
}
