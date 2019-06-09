#! /bin/bash

rm -rf /home/dev/.config/xfce4
cp -pr /home/dev/tools/xfce4 /home/dev/.config/

anyenv install --init

anyenv install nodenv
anyenv install goenv

exec $SHELL -l
