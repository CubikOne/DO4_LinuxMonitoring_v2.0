#!/bin/bash

goaccess ../04/access_logs/*.log --log-format='%h - %^[%d:%t %^] "%r" %s "%u"' -o ./report.html