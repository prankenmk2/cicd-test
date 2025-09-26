#!/bin/bash

sleep 10
DEPLOY_PATH=$(ls /home/iucorp/app/*.jar)

JAR_NAME=$(basename $DEPLOY_PATH)
CURRENT_PID=$(pgrep -f $JAR_NAME)
echo "CURRENT_PID = $CURRENT_PID"
if [ -z $CURRENT_PID ]; then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  kill -15 $CURRENT_PID
  sleep 5
fi
