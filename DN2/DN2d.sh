#!/bin/bash

# izpisi 3 procese, ki porabijo najvec pomnilnika
# kot terico (ime procesa, poraba cpu, poraba pomnilnika)
ps -axh --sort=-pcpu -o cmd,pcpu:1,pmem:1 | head -n 3 | sed -E 's/ +/ /g' | sed -E 's/\./,/g'