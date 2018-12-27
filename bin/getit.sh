for f in $(seq -w 321800 322592) ; do wget http://oeis.org/A$f/b$f.txt  ; sleep $((RANDOM%7)) ; done

