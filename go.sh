#!/bin/bash
GIT=git@github.com:psymashrum/task1.git

mkdir /tmp
mkdir /tmp/code

cd /tmp/code
git clone $GIT

echo "Success download"

docker-compose build
docker build -t ubuntu /tmp/code/
docker run -d --name ubuntu -p 80:80 ubuntu:latest

echo "Checking Nginx \n"

curl 127.0.0.1:80

echo "\nDone"
exit 0
