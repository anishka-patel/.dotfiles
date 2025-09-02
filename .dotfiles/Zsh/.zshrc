# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000

bindkey -v
setopt autocd autopushd pushdignoredups

autosuggestionspath="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
syntaxhighlightingpath="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
historysubstringpath="/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
[ -f $autosuggestionspath ] && source $autosuggestionspath
[ -f $syntaxhighlightingpath ] && source $syntaxhighlightingpath
[ -f $historysubstringpath ] && source $historysubstringpath


[ -f  "$HOME/.config/sh/alias.sh" ] && source "$HOME/.config/sh/alias.sh"
[ -f  "$HOME/.config/sh/export.sh" ] && source "$HOME/.config/sh/export.sh"
[ -f  "$HOME/.config/sh/function.sh" ] && source "$HOME/.config/sh/function.sh"

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ani/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' menu select
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
fastfetch

[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"

# bun completions
[ -s "/home/ani/.bun/_bun" ] && source "/home/ani/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f  "/usr/share/fzf/completion.zsh" ] && source "/usr/share/fzf/completion.zsh"
[ -f  "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"

# opam configuration
[[ ! -r /home/ani/.opam/opam-init/init.zsh ]] || source /home/ani/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
