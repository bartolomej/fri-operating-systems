#!/bin/bash

# skripta v datoteki $input poisce, izpise imea in sesteto kolicino posameznih imen zelisc,
# ki so podana kot drugi argumenti skripte

input=$(< "$1")

amount_pattern="[0-9]+g{0,1}"
result=""

# $@ behaves like $* except that when quoted the arguments are broken up properly if there are spaces in them
for p in "${@:2}"; do
  results=$(echo "$input" | grep -Eo "${p} ${amount_pattern}")
  sum=$(echo "$results" | grep -Eo "[0-9]+" | awk '{s+=$1} END {print s}' )
  title=$(echo "$results" | sed -E "s/${amount_pattern}//" | uniq)
  if ! [[ -z $title ]]; then
      result+="${title}${sum}\n"
  fi
done;

# remove empty lines, because there is an empty line at the end
# example: "koriander 34g\npaprika 52g\n"
echo -e "$result" | sort | sed '/^$/d'