# Increase history size
export HISTSIZE=10000
export HISTFILESIZE=10000
export PATH="$PATH:$HOME/.local/bin"
# export TERM="alacritty"

nvimpath=$(command -v nvim)
vimpath=$(command -v vim)

if [ -f $nvimpath ]; then
  export EDITOR=$nvimpath
  export VISUAL=$nvimpath
  export SYSTEMD_EDITOR=$nvimpath
  export SUDO_EDITOR=$nvimpath
elif [ -f $vimpath ]; then
  export EDITOR=$vimpath
  export VISUAL=$vimpath
  export SYSTEMD_EDITOR=$vimpath
  export SUDO_EDITOR=$vimpath
fi

if [ -d $HOME/.cargo ]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

if command -v sccache >/dev/null; then
  export RUSTC_WRAPPER=sccache
fi

if command -v go >/dev/null; then
  export GOPATH="$HOME/go/bin/"
  export PATH="$PATH:$HOME/go/bin"
fi

if [ -d $HOME/Applications ]; then
  export PATH="$PATH:$HOME/Applications"
fi

if [ -d $HOME/.emacs.d/bin ]; then
  export PATH="$PATH:$HOME/.emacs.d/bin"
elif [ -d $HOME/.config/emacs/bin ]; then
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

if command -v flatpak >/dev/null; then
  export PATH=$PATH:/var/lib/flatpak/exports/bin
fi
