#!/bin/bash

set -e

echo "Testing Green Environment..."

curl -f http://localhost:5002 > /dev/null

echo "Smoke Test Passed"
