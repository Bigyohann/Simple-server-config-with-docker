.PHONY: start stop

build:
	docker-compose --env-file .env build

start:
	docker-compose --env-file .env up -d --remove-orphans --force-recreate
stop:
	docker-compose --env-file .env stop