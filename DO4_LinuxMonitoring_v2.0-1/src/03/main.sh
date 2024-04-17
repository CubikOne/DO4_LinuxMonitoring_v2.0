#!/bin/bash

source input.sh

delete_fo_or_fi() {
    if [[ -d "$1" || -f "$1" ]]; then 
    rm -rf "$1"
    fi
}

function start_script() {
    if [ $1 -eq 1 ]; then
    echo "Specify the absolute path of the file:"
    read -r logs
    while IFS= read -r line; do
    if ! [[ $line =~ .*SIZE:.* ]]; then
    path=$(echo "$line" | awk '{print $2}' | sed 's/.$//')
    delete_fo_or_fi "$path"
    fi
    done < "$logs"
    elif [ $1 -eq 2 ]; then
    echo "Enter the start time of the view YYYY-MM-DD HH:MM: "
    read -r start_time
    echo "Enter the end time of the view YYYY-MM-DD HH:MM: "
    read -r end_time
    start_time=$(date -d "$start_time" +%s)
    end_time=$(date -d "$end_time" +%s)
    find /home/cubikone/sc21/DO4_LinuxMonitoring_v2.0-1/src/02 \( ! -path /bin -o ! -path /sbin \) -type f,d -printf "%p;%Ts\n" | while read -r foil; do
    seconds=$(echo "$foil" | awk -F';' '{printf $2}')
    paths=$(echo "$foil" | awk -F';' '{printf $1}')
    if [[ "$start_time" -lt "$seconds" && "$end_time" -gt "$seconds" ]]; then
    delete_fo_or_fi "$paths"
    fi
    done
    else 
    echo "Enter the name mask:"
    read -r maska
    find / \( ! -path /bin -o ! -path /sbin \) -type f,d -name "${maska}*" 2>/dev/null | while read -r name_path; do
    delete_fo_or_fi "$name_path"
    done
    fi
    rm -rf /home/cubikone/sc21/DO4_LinuxMonitoring_v2.0-1/src/02/report.log
}
start_script "$1"