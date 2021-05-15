#!/bin/bash

while true
do
  echo -n "Vnesite ime ukaza: "
  # preberi besedilo iz tipkovnice, ter shrani vsebino v spremenljivko cmd
  read cmd
  # shrani izhod iz ukaza type v spremenljivko, preusmeri stderr v crno luknjo, da bo izpis v vsakem primeru prazen
  cmd_type=$(type -a "$cmd" 2> /dev/null)
  echo "$cmd_type" | grep -q "not found"
  is_not_found=$?
  echo "$cmd_type" | grep -q "builtin"
  is_builtin=$?
  echo "$cmd_type" | grep -Eq "(/.*)+"
  is_external=$?
  if [ $is_not_found -eq 0 ]; then
    continue
  elif [ $is_builtin -eq 0 ] && [ $is_external -eq 0 ]; then
      echo "ObOjE"
  elif [ $is_builtin -eq 0 ]; then
    echo "VGRAJEN"
  elif [ $is_external -eq 0 ]; then
      echo "nevgrajen"
  fi
done