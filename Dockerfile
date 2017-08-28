###########################################################################
# Information and Instructions
###########################################################################
################################################
# Dockerfile for the Postgres image (Official site https://hub.docker.com/_/postgres/)
# Extends: postgres:9.6.2
# Installs the following software:
# postgres
################################################
## To build:
# docker build --no-cache=true -t postgres .
## To run, with login:
# docker run -it -p 5432:5432 --name postgres --network some-network mononoke/postgres
## To run in background:
# docker run -d -p 5436:5432 -e POSTGRES_PASSWORD=cmsp -e POSTGRES_USER=cms -e POSTGRES_DB=cms --name postgres  postgres
## To run in foreground:
# docker run -it -p 5436:5432 -e POSTGRES_PASSWORD=cmsp -e POSTGRES_USER=cms -e POSTGRES_DB=cms --name postgres  postgres
## To login when running
# docker exec -i -t (containerId) bash # obtain the containerId from docker ps
###### Only do this once up and running and initialised
## to tag
# docker tag postgres mononoke/postgres:9.6.2
## to push
# docker push mononoke/postgres:9.6.2
## to pull
# docker pull mononoke/postgres:9.6.2
################################################
# Some useful Docker commands
# To list running docker containers: "docker ps"
# When running in the background, the container needs to be stopped.
#  - type "docker ps" to get the container id
#  - type "docker stop {containerid}"
#  - type "docker rm {id}
# To log in to the container: "docker exec -it {containerid} bash"
#
###############################################
# To verify the DB:
# log in to the image
# Then  su - postgres
# Or sudo -i -u postgres
# The connect to the cms DB:  psql --username cms --dbname cms
# exit with cms=# \q
###############################################

FROM postgres:9.6.2

## Copy the CMS schema across. This will be run on first initialisation
##COPY cms-db.sql /docker-entrypoint-initdb.d