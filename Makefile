DOCKER_COMPOSE = sudo docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean: down
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) rm -f
	@if [ -n "$$(docker ps -q)" ]; then sudo docker stop $$(docker ps -q); fi
	@docker ps -aq | xargs -r docker rm -f
	docker system prune -a -f --volumes
	docker container prune -f
	docker volume prune -f
	docker network prune -f

re: clean all

status :
	@docker ps

.PHONY: all build up down clean re
