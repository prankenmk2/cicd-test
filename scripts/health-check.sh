#!/bin/bash

echo "Health Check"

for var in {1..100}
do
  HEALTH=$(curl -s 'http://localhost:8080' -o /dev/null -w "%{http_code}")
  if [ $HEALTH -eq 200 ]; then
    echo "OK"
    break
  else
    echo "FAIL..."
    sleep 2
  fi
done
