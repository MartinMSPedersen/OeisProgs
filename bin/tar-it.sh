wait && 
tar -cvf b050001-b060000.tar $(seq  -f "b0%05.0f.txt.xz" 50001 60000) 
