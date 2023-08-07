# pull official base image
FROM python:3.9.9-slim-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2
RUN apt-get update && apt-get install -y \
    gcc \
    musl-dev \
    libpq-dev \
    bash \
    git \
    libpango1.0-dev \
    libcairo2-dev \
 && pip install psycopg2

# install fonts
RUN apt-get install -y \
    fontconfig \
    fonts-dejavu

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r /usr/src/app/requirements.txt

# copy entrypoint.sh
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh

# copy project
COPY . /usr/src/app/

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
