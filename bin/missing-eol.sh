for f in *txt ; do  [ "$(tail -c 1 $f | wc -l)"  -eq 0 ] && echo $f ; done > missing-eol.txt
