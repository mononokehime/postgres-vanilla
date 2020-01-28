###########################################################################
# Information and Instructions
###########################################################################
################################################
# Dockerfile for the Postgres image (Official site https://hub.docker.com/_/postgres/)
# Extends: postgres:12.1-alpine
# Installs the following software:
# postgres
################################################
## To build:
# docker build --no-cache=true -t postgres .
## To run, with login:
# docker run -it -p 5432:5432 --name postgres --network some-network mononoke/postgres
## To run in background:
# docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=sonarPwd$ -e POSTGRES_USER=sonar -e POSTGRES_DB=sonar --name postgres  postgres
## To run in foreground:
# docker run -it -p 5432:5432 --network ci-network -e POSTGRES_PASSWORD=sonarPwd$ -e POSTGRES_USER=sonar -e POSTGRES_DB=sonar --name postgres  mononoke/postgres:12.1-alpine
## To login when running
# docker exec -i -t (containerId) bash # obtain the containerId from docker ps
###### Only do this once up and running and initialised
## to tag
# docker tag postgres mononoke/postgres:12.1-alpine
## to push
# docker push mononoke/postgres:12.1-alpine
## to pull
# docker pull mononoke/postgres:12.1-alpine
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
# The connect to the DB:  psql --username something --dbname something
# exit with something=# \q
###############################################

FROM postgres:12.1-alpine
