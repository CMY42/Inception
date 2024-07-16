DOCKER_COMPOSE = sudo docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

up: stop-services
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean: down
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) rm -f
	@if [ -n "$$(docker ps -q)" ]; then sudo docker stop $$(docker ps -q); fi
	@docker ps -aq | xargs -r sudo docker rm -f
	sudo docker system prune -a -f --volumes
	sudo docker container prune -f
	sudo docker volume prune -f
	sudo docker network prune -f

re: clean all

status :
	sudo @docker ps

# Stop Apache2 and Nginx services
stop-services:
	sudo systemctl stop apache2 || true
	sudo systemctl stop nginx || true

.PHONY: all build up down clean re status stop-services
