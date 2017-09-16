# Dev Environment

## Setup (Docker)
1. Install [Docker for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)
2. Clone this repository (and any others you want to access) to `~/dev/code`
3. Navigate to `~/dev/code/dev-environment`
4. Run `docker-compose up -d`
5. Enter the `devenv` container via `docker exec -it devenv bash`
6. Install repo dependencies:
  - navigate to a repo directory via `cd /dev/code/my-repo`
  - run `bundle`, `yarn install`, etc as you normally would for your project
7. Start your server(s)

## Note
You can delete this setup and start from scratch by running the Docker delete commands listed below, which will remove all images and containers.

## Basic Docker Commands
- `docker-compose up -d`: Create and start containers
- `docker-compose stop`: Stop services
- `docker-compose restart`: Restart services
- `docker ps`: List running containers
- `docker ps -a`: List all containers
- `docker run -it [image name]`: Run a container and interact with it
- `docker exec <container> rake db:migrate`: Run db migration for a
  particular container
- `docker rm $(docker ps -aq)`: Delete all docker containers
- `docker rmi $(docker images -aq)`: Delete all docker images
