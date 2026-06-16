#!/bin/bash

ACTIVE=$(/usr/local/bin/aws elbv2 describe-listeners \
  --region ap-south-1 \
  --listener-arns arn:aws:elasticloadbalancing:ap-south-1:938504081144:listener/app/blue-green-alb/7b8d1e8296bffc47/aeee5658472b3af6 \
  --query 'Listeners[0].DefaultActions[0].TargetGroupArn' \
  --output text)

if echo "$ACTIVE" | grep -q "blue-tg"
then
    echo "green"
else
    echo "blue"
fi
