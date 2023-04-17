#FUNCTIONS{{{

n ()
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
lfcd () {
    tmp="$(mktemp)"
    ll -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
#}}}

#ALIASES{{{
alias ls='ls --color=auto'
alias vim='nvim'
alias grep='grep --color=auto'
#alias python='/usr/bin/python3'
alias sp='sudo pacman'
alias vpn='pass show web/au.dk | sudo openconnect https://remote.au.dk/au-access -u au618187@uni.au.dk --passwd-on-stdin'
alias wget='wget --no-hsts'
alias bb='wget --no-hsts --user au618187 --ask-password'
alias yta='yt-dlp --add-metadata -i -x -f bestaudio/best -o "%(title)s.%(ext)s"'
#}}}

#Command completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
_comp_options+=(globdots)     # Include hidden files.
compinit
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
bindkey '^R' history-incremental-pattern-search-backward

#vi mode
bindkey -v
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -U colors && colors # Load colors

setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}%1~%{$fg[blue]%}%{$fg[red]%}$(parse_git_branch) %{$reset_color%}>%b '
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
