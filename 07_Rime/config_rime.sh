dir=$(
  cd $(dirname $0)
  pwd -P
)

cp $dir/config/* $HOME/.local/share/fcitx5/rime/
