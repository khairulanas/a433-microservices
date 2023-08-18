# a433-microservices
Repository ini digunakan untuk kebutuhan kelas Belajar Membangun Arsitektur Microservices

Silakan clone dengan perintah berikut.<br>
`git clone -b todo-app https://github.com/dicodingacademy/a433-microservices.git`

#create image from docker file
docker build -t todo-app:v1 .

#run container
docker run -dp 3000:3000 --name todo-app todo-app:v1