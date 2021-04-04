#!/bin/bash

# skripta za vec datotek preveri ali obstajajo ali ne (za datoteke smatra vse vrste razen imenika)
# seznam datotek je v obliki argumentov (e.g. bash DN1a.sh file1 file2,...)
for file in $*; do
  [[ -f $file || -h $file || -p $file || -S $file ]] && echo -n "1 " || echo -n "0 "
done;