#!/bin/bash

if [[ $# != 0 ]]; then
    echo "There should not be any parameters."
    exit 1;
else
    while true; do
        cpu=$(cat /proc/loadavg | awk '{print $1}')
        disk_space_total=$(df / | awk 'NR==2 {print $2}')
        disk_space_avail=$(df / | awk 'NR==2 {print $4}')
        disk_space_used=$(df / | awk 'NR==2 {print $3}')
        memory_total=$(free -b | awk 'NR==2 {print $2}')
        memory_avail=$(free -b | awk 'NR==2 {print $4}')
        memory_used=$(free -b | awk 'NR==2 {print $3}')

        metrics_html="# HELP CPU_Usage CPU load in percentage
# TYPE CPU_Usage gauge
CPU_Usage $cpu
# HELP Disk_Space_Total Total disk space in bytes
# TYPE Disk_Space_Total gauge
Disk_Space_Total $disk_space_total
# HELP Disk_Space_Avail Available disk space in bytes
# TYPE Disk_Space_Avail gauge
Disk_Space_Avail $disk_space_avail     
# HELP Disk_Space_Used Used disk space in bytes
# TYPE Disk_Space_Used gauge
Disk_Space_Used $disk_space_used
# HELP Memory_Total Total memory in bytes
# TYPE Memory_Total gauge
Memory_Total $memory_total
# HELP Memory_Used Used memory in bytes
# TYPE Memory_Used gauge
Memory_Used $memory_used
# HELP Memory_Avail Available memory in bytes
# TYPE Memory_Avail gauge
Memory_Avail $memory_avail" 

        echo "$metrics_html" > metrics.html

        sleep 3
    done
fi