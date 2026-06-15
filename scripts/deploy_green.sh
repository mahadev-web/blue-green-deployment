#!/bin/bash

docker rm -f green-app || true

docker run -d \
--name green-app \
-p 5002:5000 \
flask-app:new
