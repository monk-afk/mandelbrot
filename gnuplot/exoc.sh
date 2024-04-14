#!/bin/bash
# Execute a script when a file is modified
SCRIPT_DIR_ABS=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
CURRENT_DIR=$(pwd)
LTIME=$(stat -c %Z $1)
echo "Will rsync `basename $1` to gbox when modified."

while true ; do
    ATIME=$(stat -c %Z $1)
    if [[ "$ATIME" != "$LTIME" ]]; then
      # rsync --progress -a -e 'ssh -p 23323' $SCRIPT_DIR_ABS/ monk@10.0.0.250:/home/monk/mandelua/benchmarks/
      # lua mandelbrot.lua > tmp.png
      echo "`date +%H:%M:%S`"
      $SCRIPT_DIR_ABS/plot_brot.sh
      LTIME=$ATIME
    fi
    sleep 3
done