export PATH="$(du -L $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH:${HOME}/.local/bin/:$CARGO_HOME/bin"
export npm_config_prefix="$HOME/.local"
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERM="xterm"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export DBROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export WINIT_X11_SCALE_FACTOR=1
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export CARGO_HOME="$XDG_DATA_HOME"/cargo 
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
#export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
#export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}"/gnupg
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/
export TOPAS_G4_DATA_DIR=~/build/geant4-data
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
#Move GO
export GOPATH="$XDG_DATA_HOME"/go
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export LESSHISTFILE="-"
export PASSWORD_STORE_DIR="$HOME/.password-store"
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/isync/mbsyncrc"

#export NNN_OPTS="e"
export NNN_COLORS='4231'
export NNN_BMS='h:~;A:~/Nextcloud/Syncthing/AU/;n:~/Nextcloud/Syncthing/AU/10.semester/;d:~/Downloads/;b:~/Dokumenter/Billeder/;p:~/Dokumenter/projects/;a:~/Nextcloud/Syncthing/AU/Arbejde/'
export NNN_PLUG='o:fzopen;f:fzcd'
export BEMENU_OPTS='-H 35'
export DOTREMINDERS=~/Syncthing/rems/reminders.rem

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
export WLR_NO_HARDWARE_CURSORS=1

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s dwl > /dev/null 2>&1 && while true; do ssh-agent river; done
