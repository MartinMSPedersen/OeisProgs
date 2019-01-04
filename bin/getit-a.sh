for f in $(seq -w 1 100000) ; do wget "http://oeis.org/search?q=id:A$f&fmt=json"  -OA$f.json ; sleep $((RANDOM%10)) ; done

