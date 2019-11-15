#! /bin/bash

if [[ -d  taiga-front-dist ]]; then
    rm -rf taiga-front-dist
fi

git clone -b stable --single-branch https://github.com/taigaio/taiga-front-dist.git

docker build -t xtraterrestrial/taiga-front .

