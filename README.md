# phalcon 4 php apache
## intro
from ubuntu:bionic  
- apache2  
- php7.2  
- phalcon4
## contoh cara run pakai docker-compose
silahkan edit `docker-compose.yml` sesuai kebutuhan 
terutama bagian volumes  
kalo udah jalankan pakai perintah :  
`docker-compose up -d`  
kalau mau mematikan  
`docker-compose down`
## contoh cara run langsung
jalankan  
`docker run -d -p 80:80 -v d:/dev/php:/var/www/html --name sekarepmu nimdasx/sf-phalcon-4`  
matikan  
`docker rm -f sekarepmu`
## catatan pribadi / abaikan saja
````
docker run -d -p 80:80 --name sf-phalcon-4 nimdasx/sf-phalcon-4
docker exec -it sf-phalcon-4 tail -f /var/log/apache2/access.log
docker exec -it sf-phalcon-4 /bin/bash
docker rm -f sf-phalcon-4
docker build --tag nimdasx/sf-phalcon-4 .
````