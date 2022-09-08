alias sudo="sudo "
alias gl="gally_launcher"
alias ins="sudo pacman -Syu"
alias unins="sudo pacman -R"

alias se=sudoedit
alias e=$EDITOR
alias unfuck_wifi="sudo systemctl restart wpa_supplicant@wlp52s0"
alias bar="$HOME/.config/polybar/launch.sh"

mkcd() {
  mkdir $1
  cd $1
}

cdl() {
  cd $1
  ls
}
