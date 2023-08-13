#!/bin/sh

ssh -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP << 'ENDSSH'
  cd /root
  export $(cat .env | xargs)
  docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
  docker pull $WEB_IMAGE
  docker pull $NGINX_IMAGE
  pwd
  ls -lsa
  docker-compose -f docker-compose.develop.yml up -d --force-recreate --build
  docker image prune -a --filter "until=15m"
ENDSSH
