#!/bin/bash

# skripta v danem imeniku poisce vse datoteke z koncnico,
# jih sortira po abecedi in zapise v datoteko <imenik>_inventura.txt

imenik=$1
koncnica=$2

find "$imenik" -name "*.${koncnica}" | sort > "$(dirname "$imenik")"/"$(basename "$imenik")"_inventura.txt