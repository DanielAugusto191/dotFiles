set -e
mkdir -p $1

cp -r -n $HOME/.config/i3 $1/
cp -r -n $HOME/.config/i3status $1/
cp -r -n $HOME/.config/nvim $1/
cp -r -n $HOME/.config/kitty $1/
cp -r -n $HOME/.config/picom.conf $1/

