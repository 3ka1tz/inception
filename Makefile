COMPOSE = srcs/docker-compose.yml

up:
	docker compose -f $(COMPOSE) up -d

down:
	docker compose -f $(COMPOSE) down

build:
	docker compose -f $(COMPOSE) build

logs:
	docker compose -f $(COMPOSE) logs -f

re: down up

.PHONY: up down build logs re
