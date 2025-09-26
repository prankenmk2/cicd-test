#!/bin/bash

cd /home/iucorp/app

DEPLOY_PATH=$(ls /home/iucorp/app/*.jar)
JAR_NAME=$(basename $DEPLOY_PATH)

echo "> 현재 실행중인 애플리케이션 pid 확인"
CURRENT_PID=$(pgrep -f $JAR_NAME)

echo "CURRENT_PID = $CURRENT_PID"

if [ -z $CURRENT_PID ]; then
    echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "Master Deploy Start"
sleep 10
echo "java -jar /home/iucorp/app/$JAR_NAME  >> /home/iucorp/java.log 2>&1 &"
nohup java -jar /home/iucorp/app/$JAR_NAME  >> /home/iucorp/java.log 2>&1 &

echo "Master Health Check"
for var in {1..50}
do
  HEALTH=$(curl -s 'http://localhost:8080' -o /dev/null -w "%{http_code}")
  if [ $HEALTH -eq 200 ]; then
    echo "OK"
    break
  else
    echo "FAIL..."
    sleep 5
  fi
done
