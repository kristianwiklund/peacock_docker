# What

Configuration to run Peacock easily from docker.

# Quickstart

Use docker-compose to build and deploy:

`docker-compose build`
followed by
`docker-compose up -d`

# Details

The docker container is quite stupid, all logic resides in the start.sh script:
On container start, the script clones the latest version of Peacock, runs a build, and starts the server.

## Server versions

It is possible to select another branch by setting the BRANCH environment variable.

Example:

`BRANCH=v6 docker-compose up -d`

will download and run v6 of Peacock. 

Each server version will have its own configuration directory, no files are shared

## Running plugins

Add the plugin you want to run to the "plugins" directory. It will be deployed automatically.

## Selecting server port

This is broken.