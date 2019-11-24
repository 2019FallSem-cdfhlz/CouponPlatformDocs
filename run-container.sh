#!/bin/sh
docker run -itd --rm -p 8080:8080 --name 2019semdoc \
--mount type=bind,source=/root/sites/2019semdoc,target=/site \
hugo:latest hugo server --minify --gc -p 8080 --bind 0.0.0.0 --baseUrl=http://172.81.239.128:8080