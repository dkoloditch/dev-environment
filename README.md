# Dev Environment

## Setup (Docker)
1. Install [Docker for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)
2. Clone this repository
3. Navigate to the repo directory
4. Run `docker-compose up -d`
6. Bundle gems and install yarn dependencies:
  - run `docker exec -it dev_env bash`
  - navigate to the container repo directory (e.g. `/dev/my_repo`)
  - run `bundle` and `yarn install` as you normally would
  - start your server(s)

#### Basic Commands:
- `docker-compose up`: Create and start containers
- `docker-compose stop`: Stop services
- `docker-compose restart`: Restart services
- `docker ps`: List running containers
- `docker ps -a`: List all containers
- `docker run -it [image name]`: Run a container and SSH into it
- `docker rm $(docker ps -aq)`: Delete all docker containers (not images)
- `docker exec <container> rake db:migrate`: Run db migration for a
  particular container
- `docker rm $(docker ps -aq)`: Delete all docker containers
- `docker rmi $(docker images -aq)`: Delete all docker images
