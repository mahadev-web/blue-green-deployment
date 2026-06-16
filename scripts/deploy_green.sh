#!/bin/bash
set -e

ssh -o StrictHostKeyChecking=no -i ~/key.pem ec2-user@3.109.208.78 << 'EOF'

cd ~/blue-green-deployment

git pull origin main

docker stop green-app || true
docker rm green-app || true

docker build -t flask-app:new .

docker run -d \
  --name green-app \
  -p 80:5000 \
  flask-app:new

EOF
