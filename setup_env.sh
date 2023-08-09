#!/bin/sh

echo DEBUG=$DEBUG >> .env
echo SQL_ENGINE=django.db.backends.postgresql >> .env
echo DATABASE=postgres >> .env

#echo SECRET_KEY=$SECRET_KEY >> .env
echo ID_COMPILACION=$CI_COMMIT_SHORT_SHA >> .env
echo SERVER_IP=$SERVER_IP >> .env
echo SITE_URL=$SITE_URL >> .env
echo POSTGRES_DB=$SQL_DATABASE >> .env
echo POSTGRES_USER=$SQL_USER >> .env
echo POSTGRES_PASSWORD=$SQL_PASSWORD >> .env
echo SQL_HOST=$SQL_HOST >> .env
echo SQL_PORT=$SQL_PORT >> .env
echo WEB_IMAGE=$IMAGE:web  >> .env
echo NGINX_IMAGE=$IMAGE:nginx  >> .env
echo TRAEFIK_IMAGE=$IMAGE:traefik  >> .env
echo CI_REGISTRY_USER=$CI_REGISTRY_USER   >> .env
echo CI_JOB_TOKEN=$CI_JOB_TOKEN  >> .env
echo CI_REGISTRY=$CI_REGISTRY  >> .env
echo IMAGE=$CI_REGISTRY/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME >> .env
echo SENDGRID_API_KEY=$SENDGRID_API_KEY  >> .env
echo CELERY_BROKER_URL=$CELERY_BROKER_URL >> .env
