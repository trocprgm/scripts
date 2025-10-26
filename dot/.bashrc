#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export HISTFILE=/home/$USER/.bash_trash/.bash_history
# Gets rid of all those fucking .bash_history files
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

export EDITOR=nvim
export TERMINAL=st
export FILE_MANAGER=thunar
export XDG_CONFIG_DIRS="$HOME/.config/xfce4/xfconf/:$HOME/.config/gtk-3.0/"
# export GTK_THEME=Adwaita-dark
# export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,.cache"
# export FZF_DEFAULT_OPTS=
# export GTK_THEME="adw-gtk3:dark"
# export DE_FILE_MANAGER=thunar

export PATH="/home/$USER/scripts:$PATH"
export PATH="/home/$USER/scripts/chromium:$PATH"
export PATH="/home/$USER/Appimage:$PATH"
export PATH="/home/$USER/.screenlayout:$PATH"
export PATH="/usr/NX/bin:$PATH"
export PATH="$PATH:/home/$USER/.local/bin"
# export PATH="$PATH:/home/$USER/.local/share/applications"
#vvvv this shit is fire
#System aliases
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias setgermany="xclip -selection primary"
alias getgermany="xclip -selection primary -o"
alias setpoland="xclip -selection secondary"
alias getpoland="xclip -selection secondary -o"
alias get_idf='. $HOME/esp/esp-idf/export.sh'
#Navigation
alias home="cd /home/$USER/"
alias config="cd /home/$USER/.config/"
alias prgm="cd /home/$USER/prgm"
alias scri="cd /home/$USER/scripts"
alias suck="cd /usr/src"
alias amy="cd /home/$USER/Amy"
alias mega="cd /home/$USER/MEGA"
alias megaamy="cd /home/$USER/MEGA/Amy"
alias act="cd /home/$USER/scripts/dot"
alias thermo="cd /home/$USER/MEGA/davis/thermo/"
alias fluids="cd /home/$USER/MEGA/davis/fluids/"
alias mechmat="cd /home/$USER/MEGA/davis/mechmat/"
alias bottle48="cd /home/rhom/.var/app/com.usebottles.bottles/data/bottles/bottles/Emu48/drive_c/"
alias vimrc="nvim ~/.vimrc"
alias vimbak="cd ~/.local/share/nvim"
alias vimswap="cd ~/.local/state/nvim/swap"
alias bashrc="nvim ~/.bashrc"
alias c="exit"
#Program shortcuts
alias bottlez="flatpak run com.usebottles.bottles"
alias bg="feh --bg-fill /home/adman/.config/background/.bg.png"
# alias weather="curl https://wttr.in/"
alias vw="nvim +VimwikiIndex"
alias map="chromium --new-window https://www.google.com/maps/"
alias tv=". $HOME/.screenlayout/TV.sh"
alias laptop=". $HOME/.screenlayout/default.sh"
alias ins="sudo pacman -S"
alias light="xrandr --output eDP-1 --brightness"
alias padoff="xinput disable 12"
alias padon="xinput enable 12"
alias powerstatus="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

cdf() {
  local dir
  dir=$(fd -H --type d . '/' | fzf) || return
  cd "$dir" || return
}

#Makes fzf work?? yeah...
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_ALT_C_COMMAND="fd -H --type d"
export FZF_CTRL_T_COMMAND="fd -H --type f . '/'"
# export FZF_DEFAULT_COMMAND=${FZF_ALT_C_COMMAND:-}"fd --type d"

#/etc/enviroment is used for global variables
#
#Symbolic link is better for root user config
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
#ln -s /home/$USER/.bashrc /root/.bashrc
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
