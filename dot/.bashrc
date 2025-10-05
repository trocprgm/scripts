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

export PATH="/home/$USER/scripts:$PATH"
export PATH="/home/$USER/Appimage:$PATH"
export PATH="/home/$USER/.screenlayout:$PATH"
export PATH="/usr/NX/bin:$PATH"
export PATH="$PATH:/home/$USER/.local/bin"
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
alias prgm="cd /home/$USER/prgm"
alias scripts="cd /home/$USER/scripts"
alias suck="cd /usr/src"
alias amy="cd /home/$USER/Amy"
alias mega="cd /home/$USER/MEGA"
alias megaamy="cd /home/$USER/MEGA/Amy"
alias act="cd /home/$USER/scripts/dot"
#Program shortcuts
alias bottlez="flatpak run com.usebottles.bottles"
alias bg="feh --bg-fill /home/adman/.config/background/.bg.png"
alias weather="curl https://wttr.in/"
alias vw="nvim +VimwikiIndex"
alias map="chromium --new-window https://www.google.com/maps/"
alias tv=". $HOME/.screenlayout/TV.sh"
alias laptop=". $HOME/.screenlayout/default.sh"
# vvv fucked
#alias fzfcd="cd \"$(find . -type d | fzf)\""

cdf() {
  local dir
  dir=$(find "${1:-.}" -type d 2>/dev/null | fzf) || return
  cd "$dir" || return
}

#Makes fzf work?? yeah...
eval "$(fzf --bash)"

#/etc/enviroment is used for global variables
#
#Symbolic link is better for root user config
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
#ln -s /home/$USER/.bashrc /root/.bashrc
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
