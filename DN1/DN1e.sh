#!/bin/bash

# skripta poizvede ali je podan id uporabnika ze zaseden ali ne
# ce ni zaseden izpise se nekaj dodatnih informacij o uporabniku

uid=$1
rezerviran=$(test $uid -lt 1000 && echo "DA" || echo "NE")
search_id=$(cat /etc/passwd | cut -d':' -f3,4 | grep "^${uid}:")
uporabniki=$(cat /etc/passwd | grep "$search_id")
if [[ $search_id ]]; then
  uporabnik=$(echo "$uporabniki" | cut -d':' -f1)
  imenik=$(echo "$uporabniki" | cut -d':' -f6)
  lupina=$(basename $(echo "$uporabniki" | cut -d':' -f7))
  echo "uid: ${uid}"
  echo "uporabnik: ${uporabnik}"
  echo "imenik: ${imenik}"
  echo "lupina: ${lupina}"
  echo "rezerviran: ${rezerviran}"
else
  echo "prosto!"
  echo "rezerviran: ${rezerviran}"
fi