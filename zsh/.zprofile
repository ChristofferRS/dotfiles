export PATH="$(du -L $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH:${HOME}/.local/bin/"
export EDITOR="nvim"
export TERMINAL="st"

export BROWSER="brave"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
#export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}"/gnupg
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/build/topas/libexternal
export TOPAS_G4_DATA_DIR=~/build/geant4-data
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
#Move GO
export GOPATH="$XDG_DATA_HOME"/go
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export LESSHISTFILE="-"
export PASSWORD_STORE_DIR="$HOME/.password-store"
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/isync/mbsyncrc"

export NNN_OPTS="e"
export NNN_COLORS='4231'
export NNN_BMS='h:~;A:~/Syncthing/AU/;n:~/Syncthing/AU/6.semester/;d:~/Downloads/;b:~/Dokumenter/Billeder/'
export NNN_PLUG='o:fzopen;f:fzcd'

export DOTREMINDERS=~/Syncthing/rems/reminders.rem

#StartX if not running in tty
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
