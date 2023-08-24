#!/bin/bash

# membuat image bernama item-app dengan tag v1 menggunakan Dockerfile(.)
docker build -t item-app:v1 .

# mengecek daftar iamges di lokal
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages (saran keempat).
docker tag item-app:v1 ghcr.io/khairulanas/item-app:v1

# Login ke GitHub Packages  (saran keempat) via Terminal.
echo $PASSWORD_GITHUB_PACKAGES | docker login ghcr.io -u khairulanas --password-stdin 

# Mengunggah image ke GitHub Packages (saran keempat).
docker push ghcr.io/khairulanas/item-app:v1