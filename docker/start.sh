#! /bin/bash

function jwm() {
  docker info &> /dev/null \
    || { echo 'Is the docker daemon running?'; return; }
  local -r display=1
  [[ -e "/tmp/.X11-unix/X${display}" ]] \
    || Xephyr -wr -resizeable ":${display}" &> /dev/null &
  docker run \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v /run/user/$UID/pulse/native:/tmp/pulse/native \
    -v $HOME/.config/pulse/cookie:/tmp/pulse/cookie \
    -it --rm ubuntu-jwm &> /dev/null
  pkill Xephyr
}

jwm
