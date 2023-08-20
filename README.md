# a433-microservices
Repository ini digunakan untuk kebutuhan kelas Belajar Membangun Arsitektur Microservices

Silakan clone dengan perintah berikut.<br>
`git clone -b todo-app https://github.com/dicodingacademy/a433-microservices.git`

#create image from docker file
docker build -t todo-app:v1 .

#run container
docker run -dp 3000:3000 --name todo-app todo-app:v1

#rebuild after edit
docker build -t todo-app:v2 .

#delete old container
docker rm -f todo-app

#run new container
docker run -dp 3000:3000 --name todo-app todo-app:v2

#membuat volume
docker volume create todo-db

#run container with volume
docker run -dp 3000:3000 --name todo-app -v todo-db:/etc/todos todo-app:v2

#buat custom network bertipe bridge
docker network create todo-app

#list network
docker network ls

#run container baru untuk MySQL bernama mysql-db, lampirkan network yang tadi dibuat (sekaligus membuat alias atau nama lain dari network todo-app, yakni mysql), serta membuat volume baru bernama todo-mysql-data dan sekaligus memasangnya ke directory /var/lib/mysql di dalam container (yang mana ini adalah lokasi untuk MySQL secara default menulis data).---in mac

docker run -d --name mysql-db --network todo-app --network-alias mysql --platform "linux/amd64" -v todo-mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=dicoding -e MYSQL_DATABASE=todo-db mysql:5.7

#masuk ke container mysql
docker exec -it mysql-db mysql -u root -p

#run container todo app
docker run -dp 3000:3000 --name todo-app -w /app -v "$(pwd):/app" --network todo-app -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=dicoding -e MYSQL_DB=todo-db node:12-alpine sh -c "yarn install && yarn run dev"

#build with docker compose
docker compose up -d

#hapus docker compose
docker compose down --volumes