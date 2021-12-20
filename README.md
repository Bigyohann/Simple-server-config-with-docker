# Simple Server configuration with Traefik, Portainer, Uptime Kuma, MongoDB and Mongo Express 

> Starter kit to setup a webserver with docker and traefik

This is probably not perfect, feel free to improve it with your own needs

## Getting started 
Edit the .env file to setup your own url and parameters 

Start containers with 
`make build` then `make start`

## Adding services
To add any dockerized services to the configuration, you can add traefik-proxy network and some labels to your docker-compose file in your project for every services you need to add
(no need to add config in this docker-compose file, i prefer to keep a different docker-compose file for every project). 

### Example: 
#### Simple app:
```
version: "3.7"
services:
  app:
    build:
      dockerfile: ./docker/Dockerfile
      context: ./
    container_name: ${APP_CONTAINER_NAME}
    restart: always
    networks:
      - traefik-proxy
    volumes:
      - ./docker/app/nginx:/etc/nginx
    labels:
      - traefik.enable=true
      - traefik.http.routers.${APP_CONTAINER_NAME}.rule=Host(`${APP_URL}`)
      - traefik.http.routers.${APP_CONTAINER_NAME}.entrypoints=websecure
      - traefik.http.routers.${APP_CONTAINER_NAME}.tls=true
      - traefik.http.routers.${APP_CONTAINER_NAME}.tls.certresolver=letsencrypt

```
#### Reverse proxy serve:
Check uptime kuma configuration

