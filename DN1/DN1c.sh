#!/bin/bash

# skripta v danem imeniku poisce vse datoteke z koncnico,
# jih sortira po abecedi in zapise v datoteko <imenik>_inventura.txt

imenik=$1
koncnica=$2
prefix=$(echo "${imenik}" | rev | cut -d'/' -f-1 | rev)

find "$imenik" -name "*.${koncnica}" | sort > "${imenik}"/"${prefix}"_inventura.txt