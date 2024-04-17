#!/bin/bash

function sort_by_code() {
    for i in {1..5}; do
        log_file="../04/access_logs/$i.log"
        awk '{print $0}' $log_file | sort -n -k 8
    done 
        
}

function sort_by_ip() {
    for i in {1..5}; do
        log_file="../04/access_logs/$i.log"
        awk '{print $1}' $log_file | sort -u
    done 
}

function sort_by_errors() {
    for i in {1..5}; do
        log_file="../04/access_logs/$i.log"
        awk '{
            if ($7 >= 400) {
                print $0
            }
        }' $log_file 
    done 
}

function sort_by_ip_error() {
    for i in {1..5}; do
        log_file="../04/access_logs/$i.log"
        awk '{
            if ($7 >= 400) {
                print $1
            }
        }' $log_file | sort -u
    done 
}