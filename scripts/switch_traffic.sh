#!/bin/bash

sudo cp nginx/green.conf /etc/nginx/conf.d/app.conf

sudo nginx -t

sudo systemctl reload nginx
