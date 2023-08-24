# Menggunakan base image Node.js versi 14
FROM node:14

# set working directory di container ke folder /app
WORKDIR /app

# Copy semua berkas di folder saat ini(.) kedalam container pada folder(/app)
COPY . /app

# Menentukan agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-dbsebagai database host
ENV NODE_ENV=production DB_HOST=item-db 

# Menginstal dependencies untuk production dan kemudian build aplikasi.
RUN npm install --production --unsafe-perm && npm run build

# expose port container di 8080
EXPOSE 8080

# Saat container diluncurkan, jalankan server dengan perintah npm start
CMD ["npm", "start"]