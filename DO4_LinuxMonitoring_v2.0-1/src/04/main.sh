#!/bin/bash

if [[ $# -ne 0 ]]; then
	echo "Там не должно быть никаких параметров."
	exit 1
fi

mkdir access_logs

. ./log.sh