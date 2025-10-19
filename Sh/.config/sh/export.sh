# Increase history size
export HISTSIZE=10000
export HISTFILESIZE=10000
export PATH="$PATH:$HOME/.local/bin"
# export TERM="alacritty"

if [ -f /usr/bin/nvim ]; then
    export EDITOR="/usr/bin/nvim"
    export VISUAL="/usr/bin/nvim"
elif [ -f /usr/bin/vim ]; then
    export EDITOR="/usr/bin/vim"
    export VISUAL="/usr/bin/vim"
fi

if [ -f /usr/bin/vim ]; then
    export SYSTEMD_EDITOR="/usr/bin/vim"
    export SUDO_EDITOR="/usr/bin/vim"
fi


if [ -d $HOME/.cargo ] ; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

if command -v sccache >/dev/null; then
    export RUSTC_WRAPPER=sccache
fi

if command -v go >/dev/null; then
    export GOPATH="$HOME/go/bin/"
    export PATH="$PATH:$HOME/go/bin"
fi


if [ -d $HOME/Applications ] ; then
    export PATH="$PATH:$HOME/Applications"
fi

if [ -d $HOME/.emacs.d/bin ] ; then
    export PATH="$PATH:$HOME/.emacs.d/bin"
elif [ -d $HOME/.config/emacs/bin ] ; then
    export PATH="$PATH:$HOME/.config/emacs/bin"
fi

if command -v nix >/dev/null; then
    export NIXPKGS_ALLOW_UNFREE=1
    export MANPATH="$MANPATH:$HOME/.nix-profile/share/man"
fi

if command -v nvim >/dev/null; then
    export MANPAGER="nvim +Man!"
fi

if command -v moor >/dev/null; then
    export PAGER="moor"
fi
