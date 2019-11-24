#!/bin/sh
SITE_NAME=2019semdoc
PORT=8080

# 备案之前只能先用IP了
DOMAIN=172.81.239.128
docker run -itd --rm -p ${PORT}:${PORT} --name hugo-${SITE_NAME} \
--mount type=bind,source=/root/sites/${SITE_NAME},target=/site \
hugo:latest hugo server --minify --gc -p ${PORT} --bind 0.0.0.0 --baseUrl=http://${DOMAIN}:${PORT}
