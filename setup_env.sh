#!/bin/sh

echo "DEBUG=${{ secrets.DEBUG }}" >> .env
echo "SQL_ENGINE=django.db.backends.postgresql" >> .env 
echo "DATABASE=postgres" >> .env
echo "ID_COMPILACION=$GITHUB_SHA" >> .env  
echo "SERVER_IP=${{ secrets.SERVER_IP }}" >> .env
echo "SITE_URL=${{ secrets.SITE_URL }}" >> .env
echo "POSTGRES_DB=${{ secrets.SQL_DATABASE }}" >> .env
echo "POSTGRES_USER=${{ secrets.SQL_USER }}" >> .env
echo "POSTGRES_PASSWORD=${{ secrets.SQL_PASSWORD }}" >> .env
echo "SQL_HOST=${{ secrets.SQL_HOST }}" >> .env
echo "SQL_PORT=${{ secrets.SQL_PORT }}" >> .env
echo "WEB_IMAGE=${{ env.IMAGE }}:web" >> .env
echo "NGINX_IMAGE=${{ env.IMAGE }}:nginx" >> .env 
echo "TRAEFIK_IMAGE=${{ env.IMAGE }}:traefik" >> .env
echo "CI_REGISTRY_USER=${{ secrets.REGISTRY_USER }}" >> .env
echo "CI_JOB_TOKEN=${{ secrets.REGISTRY_PASSWORD }}" >> .env
echo "CI_REGISTRY=${{ secrets.REGISTRY_URL }}" >> .env
echo "IMAGE=${{ secrets.REGISTRY_URL }}/$GITHUB_REPOSITORY" >> .env  
echo "SENDGRID_API_KEY=${{ secrets.SENDGRID_KEY }}" >> .env
echo "CELERY_BROKER_URL=${{ secrets.CELERY_BROKER }}" >> .env