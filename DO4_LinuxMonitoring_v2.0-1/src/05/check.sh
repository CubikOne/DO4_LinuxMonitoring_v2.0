#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Там должен быть один параметр."
	exit 1
fi

if ! [[ $1 =~ [[:digit:]] ]]; then
	echo -e "Параметром должно быть число.\nnпожалуйста, введите число."
	exit 1
fi

if ! [[ $1 -eq 1 || $1 -eq 2 || $1 -eq 3 || $1 -eq 4 ]]; then
	exit 1
fi