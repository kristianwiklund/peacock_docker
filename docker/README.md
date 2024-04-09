# What

Configuration to run Peacock easily from docker.

# How

Use docker-compose to build and deploy:

`docker-compose build`
followed by
`docker-compose up -d`

# Details

The docker container is quite stupid, all logic resides in the start.sh script:
On container start, the script clones the latest version of Peacock, runs a build, and starts the server.


