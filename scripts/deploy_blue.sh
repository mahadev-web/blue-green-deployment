#!/bin/bash
set -e

ssh -o StrictHostKeyChecking=no -i ~/key.pem ec2-user@13.201.192.103 << 'EOF'

cd ~/blue-green-deployment

git pull origin main

docker stop flask-app || true
docker rm flask-app || true

docker build -t flask-app:v3 .

docker run -d \
  --name flask-app \
  -p 80:5000 \
  flask-app:v3

EOF
