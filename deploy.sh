#!/bin/sh

ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP << 'ENDSSH'
  cd /root
  export $(cat .env | xargs)
  echo $CI_REGISTRY_USER
  echo $CI_JOB_TOKEN
  echo $CI_REGISTRY
  env
  docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
  docker pull $WEB_IMAGE
  docker pull $NGINX_IMAGE
  pwd
  ls -lsa
  docker-compose -f docker-compose.stagin.yml up -d --force-recreate --build
  docker image prune -a --filter "until=15m"
ENDSSH
