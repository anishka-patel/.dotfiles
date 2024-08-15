# export TERM="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
# Incrase history size
export HISTSIZE=10000
export HISTFILESIZE=10000

export NIXPKGS_ALLOW_UNFREE=1
export RUSTC_WRAPPER=sccache

export GOPATH="$HOME/go/bin/"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.GodotMono:$PATH"
export PATH="$HOME/.GodotMono3:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export MANPATH="/nix/var/nix/profiles/default/share/man:$MANPATH"
export MANPATH="$HOME/.nix-profile/share/man:$MANPATH"
