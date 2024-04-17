#!/bin/bash

source input.sh
source output.sh
dir=`realpath "."`

function start_script() {
check_arg "$1" "$2" "$3"
for ((i = 0; ; i++)); do
create_folders $i
done
}
start_script "$1" "$2" "$3"