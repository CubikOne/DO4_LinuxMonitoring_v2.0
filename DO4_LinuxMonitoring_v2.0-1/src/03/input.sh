#!/bin/bash

# Проверка на количество параметров
if [ "$#" -ne "1" ]; then 
echo -e "\e[91mError. The script must be run with 1 parameters.\e[0m"
exit 1
fi

# Проверка первого параметра $1
if [[ "$1" =~ ^[^1-3]$ ]]; then
echo -e "\e[91mError. Parameter has values ​​from 1-3 "$1"\e[0m"
exit 1
fi