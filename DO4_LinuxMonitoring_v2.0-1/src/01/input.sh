#!/bin/bash

dir=$1
folders_num=$2
folders_names=$3
files_num=$4
files_names=$5
file_size=$6

IFS='.' read -a array_fi <<< $files_names

# Проверка на количество параметров
if [ "$#" -ne "6" ]; then 
echo -e "\e[91mError. The script must be run with 6 parameters.\e[0m"
exit 1
fi

# Проверка первого параметра $1 
if ! [ -d "$dir" ]; then
echo -e "\e[91mError. Invalid directory name: "$dir"\e[0m"
exit 1
fi 

dir=`realpath $dir`
# Проверка второго параметра $2
if [[ "$folders_num" =~ [^0-9]+ ]]; then
echo -e "\e[91mError. Parameter is not a number: "$folders_num"\e[0m"
exit 1
fi 

# Проверка третьего параметра $3

if [ ${#folders_names} -gt "7" ]; then
echo -e "\e[91mError. Line more than 7 characters: "${#folders_names}"\e[0m"
exit 1
fi

if [[ "$folders_names" =~ [^a-zA-Z]+ ]]; then
echo -e "\e[91mError. Parameter contains invalid characters: "$folders_names"\e[0m"
exit 1
fi

# Проверка параметров четвертого параметра $4

if [[ "$files_num" =~ [^0-9]+ ]]; then
echo -e "\e[91mError. Parameter is not a number: "$folders_num"\e[0m"
exit 1
fi 

# Проверка параметров пятого параметра $5
# Параметр 5 - список букв английского алфавита, используемый в имени файла и расширении (не более 7 знаков для имени, не более 3 знаков для расширения). 

if [[ ! "$files_names" =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]] ; then
echo -e "\e[91mError. Invalid parameters: "$files_names"\e[0m"
exit 1
fi

# Проверка параметров шестого параметра $6

if [[ ! "$file_size" =~ ^^[1-9][0-9]?kb$|^100kb$ ]] ; then
echo -e "\e[91mError. Invalid parameters: "$file_size"\e[0m"
exit 1
else
file_size=${file_size%?}
fi