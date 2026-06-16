#!/bin/bash
set -e

/usr/local/bin/aws elbv2 modify-listener \
  --region ap-south-1 \
  --listener-arn arn:aws:elasticloadbalancing:ap-south-1:938504081144:listener/app/blue-green-alb/7b8d1e8296bffc47/aeee5658472b3af6 \
  --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-south-1:938504081144:targetgroup/green-tg/852e4e664f728010
