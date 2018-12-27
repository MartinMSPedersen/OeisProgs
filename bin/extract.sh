#!/bin/bash

for f in *xz 
do
	NUM=$(xzcat $f | grep -v '#' | cut -f2 -d' ' | egrep '^-?[0-9]+$' | sort | uniq | wc -l)
	echo ^A$(basename $f .txt.xz)^$NUM'|'
done > few_values.txt 

for NUM in {2..8}
do
	fgrep "^$NUM|" few_values.txt | tr -d 'b' | sed "s/\^$NUM|/,/" | tr -d '^' | tr '\n' ' ' > few$NUM.txt
done
