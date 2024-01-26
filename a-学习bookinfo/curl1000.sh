
for i in $(seq 1 1000); 
do 
    curl -s -o /dev/null "http://192.168.168.246:30711/productpage?u=normal"; 
done
