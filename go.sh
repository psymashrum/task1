#!/usr/bin/env bash
GIT=git@github.com:psymashrum/task1.git
WORK_FOLDER=/tmp
CODE_FOLDER=/code
PROJECT_FOLDER=${WORK_FOLDER}/${CODE_FOLDER}
TASK_FOLDER=${PROJECT_FOLDER}/task1

if [ ! -d ${WORK_FOLDER} ]; then
  mkdir ${WORK_FOLDER}
fi

mkdir ${PROJECT_FOLDER}
cd ${PROJECT_FOLDER}

git clone ${GIT}

echo "Success download"
cd ${TASK_FOLDER}
docker-compose build
docker build -t ubuntu ${PROJECT_FOLDER}
docker run -d --name ubuntu -p 80:80 ubuntu:latest

echo "Checking Nginx \n"

curl 127.0.0.1:80

echo "\nDone"
exit 0
