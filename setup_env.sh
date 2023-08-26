#!/bin/sh

echo "DEBUG=$DEBUG" >> .env
echo "SQL_ENGINE=django.db.backends.postgresql" >> .env 
echo "DATABASE=postgres" >> .env

echo "SERVER_IP=$SERVER_IP" >> .env
echo "SITE_URL=$SITE_URL" >> .env
echo "POSTGRES_DB=$POSTGRES_DB" >> .env
echo "POSTGRES_USER=$POSTGRES_USER" >> .env
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" >> .env
echo "SQL_HOST=db" >> .env
echo "SQL_PORT=$SQL_PORT" >> .env

echo "IMAGE=$IMAGE" >> .env  
echo "WEB_IMAGE=$IMAGE:web" >> .env
echo "NGINX_IMAGE=$IMAGE:nginx" >> .env 
echo "TRAEFIK_IMAGE=$IMAGE:traefik" >> .env

echo "ID_COMPILACION=$GITHUB_SHA" >> .env  
echo "CI_REGISTRY_USER=$CI_REGISTRY_USER" >> .env
echo "CI_JOB_TOKEN=$CI_JOB_TOKEN" >> .env
echo "CI_REGISTRY=$CI_REGISTRY" >> .env
echo "CELERY_BROKER_URL=$CELERY_BROKER_URL" >> .env

