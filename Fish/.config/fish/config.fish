set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block
set fish_vi_force_cursor true

if command -v nvim >/dev/null
    alias vi=nvim
    alias nv=nvim
end

alias info="info --vi-keys"
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

if command -v lsd >/dev/null
    alias ls='lsd -h --color=auto --group-directories-first'
end

if command -v moar >/dev/null
    alias more=moar
    alias less=moar
end

if command -v bat >/dev/null
    alias cat='bat --theme Dracula'
end

if command -v fastfetch >/dev/null
    alias ff=fastfetch
end

alias datef="date -u +%a,\ %Y-%b-%d"
alias datetimef="date -u +%a,\ %Y-%b-%d%n%H:%M\ \(%Z\)"
alias wget="wget -c -T 60"

set nvimeditor $(command -v nvim)
if command -v nvim &>/dev/null
    export EDITOR="nvim"
    export VISUAL="nvim"
    export SUDO_EDITOR="$nvimeditor"
else
    export EDITOR="vim"
    export VISUAL="vim"
    export SUDO_EDITOR="vim"
end

export MANPAGER="nvim +Man!"

function sesh-connect
    sesh connect $(sesh list | fzf)
end

bind \et sesh-connect
bind --mode insert \et sesh-connect



if status is-interactive
    # Commands to run in interactive sessions can go here
    
    if command -v zoxide >/dev/null
        zoxide init fish | source 
    end 
    if command -v starship >/dev/null
        starship init fish | source
    end 
    if command -v fzf >/dev/null
        fzf --fish | source
    end 
    fish_vi_key_bindings
    if command -v fastfetch >/dev/null
        fastfetch
    end 
end

