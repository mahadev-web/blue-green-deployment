#!/bin/bash
set -e

ssh -o StrictHostKeyChecking=no -i ~/key.pem ec2-user@13.201.192.103 << 'EOF'

cd ~/blue-green-deployment

git pull origin main

docker stop blue-app || true
docker rm blue-app || true

docker build -t flask-app:blue .

docker run -d \
  --name blue-app \
  -p 80:5000 \
  flask-app:blue

EOF
