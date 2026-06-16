#!/bin/bash
set -e

ssh -o StrictHostKeyChecking=no -i ~/key.pem ec2-user@3.109.208.78 << 'EOF'

curl -f http://localhost

EOF
