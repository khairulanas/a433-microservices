# Docker akan mengunduh/mengambil base image bernama node dari Docker Hub dengan tag 12-alpine. Bila sudah pernah diunduh sebelumnya, Docker akan mengambil dari lokal.
FROM node:12-alpine

#Kita memasang beberapa package seperti python2, g++, dan make.
RUN apk add --no-cache python2 g++ make

# Kita membuat directory baru bernama app di dalam container dan menjadikannya sebagai working directory. Dengan begitu, instruksi apa pun yang kita tulis di baris berikutnya, akan dieksekusi di dalam directory /app ini.
WORKDIR /app

# Tanda titik pertama menunjukkan source, sementara tanda titik kedua adalah destination. Itu artinya, kita menyalin semua berkas yang ada di local working directory saat ini (misalnya, /home/fikrihelmi17/Project/Microservices/a433-microservices yang berisi dua folder: spec dan src; serta tiga berkas: Dockerfile, package.json, dan yarn.lock) ke container working directory (yakni, /app).
COPY . .

# Kita menjalankan perintah yarn install --production untuk menginstal berbagai dependencies yang dibutuhkan oleh aplikasi Todo App pada environment production (selain bagian devDependecies pada berkas package.json).
RUN yarn install --production

# Kita mengeksekusi perintah untuk menjalankan aplikasi Todo App, yakni ["node", "src/index.js"] yang berarti node src/index.js bila pada shell.
CMD ["node", "src/index.js"]

# Karena pada berkas src/index.js kita menentukan bahwa aplikasi berjalan pada port 3000, di sini kita pun mengekspos port yang akan digunakan oleh container, yakni 3000. 
EXPOSE 3000