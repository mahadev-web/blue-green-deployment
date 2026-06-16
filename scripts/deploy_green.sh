#!/bin/bash
set -e

ssh ec2-user@3.109.208.78 << 'EOF'

cd ~/blue-green-deployment

docker rm -f green-app || true

docker build -t flask-app:new .

docker run -d \
  --name green-app \
  -p 80:5000 \
  flask-app:new

EOF
