#!/bin/bash

# skripta na vhod prejme datoteko, ki vsebuje seznam datotek
# izracuna skupno velikost datotek, ki so zapisane na seznamu

inventura_file=$1
inventura_content=$(cat "$inventura_file")
total=0

for line in $inventura_content; do
  if [[ ! -f $line ]]; then
    echo "Napaka v inventarju!"
    exit 10
  fi
  total=$(($total + $(stat -c %s $line)))
done;

echo "${total} B"