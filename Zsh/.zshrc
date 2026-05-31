# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000

bindkey -v
setopt autocd autopushd pushdignoredups

if command -v brew >/dev/null; then
    autosuggestionspath="/home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    syntaxhighlightingpath="/home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    historysubstringpath="/home/linuxbrew/.linuxbrew/share/zsh-history-substring-search.zsh"
    eval "$(brew shellenv)"
else
    autosuggestionspath="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    syntaxhighlightingpath="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    historysubstringpath="/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi
[ -f $autosuggestionspath ] && source $autosuggestionspath
[ -f $syntaxhighlightingpath ] && source $syntaxhighlightingpath
[ -f $historysubstringpath ] && source $historysubstringpath


autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ani/.zshrc'

autoload -Uz compinit
fpath+=~/.zfunc
compinit
# End of lines added by compinstall
zstyle ':completion:*' menu select

if command -v starship >/dev/null; then
    eval "$(starship init zsh)"
fi
if command -v zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi

if command -v tv >/dev/null; then
    eval "$(tv init zsh)"
fi

if command -v fzf >/dev/null; then
    FZF_CTRL_R_COMMAND= FZF_CTRL_T_COMMAND= source <(fzf --zsh)
fi

if command -v carapace >/dev/null; then
    # ${UserConfigDir}/zsh/.zshrc
    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
    zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
    source <(carapace _carapace)
    zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
fi

# bun completions
[ -s "/home/ani/.bun/_bun" ] && source "/home/ani/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opam configuration
[[ ! -r /home/ani/.opam/opam-init/init.zsh ]] || source /home/ani/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

if command -v sesh >/dev/null; then
    zle     -N             sesh-sessions
    bindkey -M emacs '\es' sesh-sessions
    bindkey -M vicmd '\es' sesh-sessions
    bindkey -M viins '\es' sesh-sessions

    zle     -N             sesh-connect
    bindkey -M emacs '\et' sesh-connect
    bindkey -M vicmd '\et' sesh-connect
    bindkey -M viins '\et' sesh-connect
fi
# Change cursor shape for different vi modes
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q' # Set block cursor
    else
        echo -ne '\e[5 q' # Set beam cursor
    fi
}
zle -N zle-keymap-select
precmd_functions+=(zle-keymap-select)
### bling.sh source start
test -f /usr/share/ublue-os/bling/bling.sh && source /usr/share/ublue-os/bling/bling.sh
### bling.sh source end
#
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@21/bin:$PATH"

[ -f  "$HOME/.config/sh/alias.sh" ] && source "$HOME/.config/sh/alias.sh"
[ -f  "$HOME/.config/sh/export.sh" ] && source "$HOME/.config/sh/export.sh"
[ -f  "$HOME/.config/sh/function.sh" ] && source "$HOME/.config/sh/function.sh"
[ -f "$HOME/.config/sh/tty.sh" ] && source "$HOME/.config/sh/tty.sh"

[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"

if command -v fastfetch >/dev/null; then
    term=$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$) | awk -F/ '{print $NF}')
    case $term in
        kitty | konsole) 
            /usr/bin/fastfetch 
            ;;
        *)
            /usr/bin/fastfetch --config /home/ani/.config/fastfetch/noimg-config.jsonc
            ;;
    esac
fi
