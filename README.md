# Deploying Staging Django with Traefik
This is the second post in a series on deploying a Dockerized Django application. 

In the [Ready to use Django Postgres over Devcontainers (first part) ](https://github.com/username/django-devcontainer-tutorial), we learned how to set up a development environment using DevContainers.

Now we will go further and explain a configuration ready for deploying your first staging environment. This project demonstrates deploying a Django application to a staging environment using Docker, Traefik and GitHub Actions for automated deployment.

## Overview
**The application consists of:**

- A Django app with Postgres database
- Nginx server to serve the Django app
- Traefik as a load balancer
- Docker for containerization
- GitHub Actions for automated deployment

When pushing to the main branch, a GitHub Actions workflow builds the Docker images, pushes them to GitHub Container Registry, and deploys the app to the staging server.


## Requirements
- Docker Engine
- Docker Compose
- Access to GitHub Container Registry for image storage
- Server with Docker installed (e.g. DigitalOcean Droplet)
- GitHub account with access to the repo

## Setup
- Clone the repository
- Set up GitHub secrets al variables required and server access tokens the workflow `main.yml` will generate automaticaly the `.env` file with all the variables required
- Configure deploy keys to grant SSH access to server

#### Variables to configure
| Variable | Usage | Example |
|-|-|-|
| DEBUG | Enables Django's debug mode | true |
| SQL_ENGINE | Configures Django's database engine | django.db.backends.postgresql |
| DATABASE | Default database to use | mydatabase |
| SERVER_IP | IP address of the server | 192.168.1.100 |
| SITE_URL | Base URL of the site | https://example.com |  
| POSTGRES_DB | Postgres database name | mydb |
| POSTGRES_USER | Postgres database username | myuser |
| POSTGRES_PASSWORD | Postgres user password | 12345 |
| SQL_HOST | Hostname of the database server | db |
| SQL_PORT | Port the database is listening on | 5432 |
| IMAGE | Base image name for Docker | myimage |
| WEB_IMAGE | Image name for web container | myimage:web |
| NGINX_IMAGE | Image name for Nginx container | myimage:nginx |
| TRAEFIK_IMAGE | Image name for Traefik container | myimage:traefik |
| ID_COMPILACION | GitHub commit SHA for image tag | 0a1b2c3d4e5f |
| CI_REGISTRY_USER | Username for container registry | myuser |
| CI_JOB_TOKEN | Authentication token for registry | 12345 |
| CI_REGISTRY | Container registry hostname | docker.pkg.github.com |
| CELERY_BROKER_URL | Broker URL for Celery | amqp://guest:guest@rabbitmq:5672/ |

For more info on setting environment variables, see the [GitHub Documentation](https://docs.github.com/en/actions/reference/environment-variables).
## Usage
On push to main, the `main.yml` workflow will:

- Build the Docker images and push them to GitHub Container Registry 
- Connect to the server via SSH, see [deploy.sh](https://github.com/twine003/deploying_stagin_django_traefik/blob/main/deploy.sh)
- Stop any existing containers
- Pull the latest images from GitHub Container Registry
- Start the containers with docker-compose

***The full deploy process is automated once setup.***
![Alt text](image.png)


## Maintenance
- Monitor Docker Compose and Traefik logs
- Update configurations and secrets as needed
- Manage SSL certificate renewals via Let's Encrypt

## Contributing
Contributions and PRs are welcome! Please create an issue before submitting a PR.

License
MIT License

Please let me know if you would like me to modify or expand on the README draft. I'm happy to iterate based on your feedback.