#!/bin/bash

# skripta v datoteki $input poisce, izpise imea in sesteto kolicino posameznih imen zelisc,
# ki so podana kot drugi argumenti skripte

# zajamemo preusmeritev vhodne datoteke v spremenljivko
input=$(< "$1")

# regex vzorec ki isce pojavitve zapisov kolicin zelisc (e.g. 12g, 4g,..)
amount_pattern="[0-9]+g{0,1}"
# razultat, ki ga bomo izpisali na stdout
result=""

# za vsako ime zelisca (argumenti od drugega mesta naprej) sestejemo kolicino
# NOTE: $@ behaves like $* except that when quoted the arguments are broken up properly if there are spaces in them
for p in "${@:2}"; do
  # poiscemo vse zapise kolicin zelisc in sestejemo vsote
  results=$(echo "$input" | grep -Eo "${p} ${amount_pattern}")
  # z orodjem awk sestejemo stevilke v posameznih vrsticah
  sum=$(echo "$results" | grep -Eo "[0-9]+" | awk '{s+=$1} END {print s}' )
  title=$(echo "$results" | sed -E "s/${amount_pattern}//" | uniq)
  # ce se zelisce z imenom $title pojavlja v vhodu, zapisemo sestevek v razultat
  if ! [[ -z $title ]]; then
      result+="${title}${sum}\n"
  fi
done;

# remove empty lines, because there is an empty line at the end
# example: "koriander 34g\npaprika 52g\n"
echo -e "$result" | sort | sed '/^$/d'