# phalcon 4 php apache
from ubuntu  
- apache2  
- php7.2  
- phalcon4
## contoh cara run kalau pakai docker-compose
silahkan edit `docker-compose.yml` sesuai kebutuhan 
teruatama bagian volumes  
kalo udah jalankan pakai perintah :  
`docker-compose up -d`  
kalau mau mematikan  
`docker-compose down`
## contoh cara run langsung (tidak pakai docker-compose)
jalankan  
`docker run -d -p 80:80 -v d:/dev/php:/var/www/html --name sekarepmu nimdasx/sf-phalcon-4`  
matikan  
`docker rm -f sekarepmu`
## catatan pribadi / abaikan saja
`docker build --tag nimdasx/sf-phalcon-4 .`  
`docker push nimdasx/sf-phalcon-4`