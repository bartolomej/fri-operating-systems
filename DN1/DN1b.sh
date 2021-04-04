#!/bin/bash

# skripta dodeli read & execute permission vsem uporabniku v seznamu za dano datoteko
# datoteka je podana kot prvi element seznama, ostali argumenti so uporabniki

file=$1
users=${*:2}

for user in $users; do
  setfacl -m u:"${user}":rx "${file}"
done;