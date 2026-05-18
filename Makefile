COMPOSE = srcs/docker-compose.yml

up:
	docker compose -f $(COMPOSE) up -d

down:
	docker compose -f $(COMPOSE) down

build:
	docker compose -f $(COMPOSE) build

logs:
	docker compose -f $(COMPOSE) logs -f

clean:
	docker compose -f $(COMPOSE) down --rmi local

fclean:
	docker compose -f $(COMPOSE) down --volumes --rmi all

reset-data:
	sudo rm -rf /home/elopez-u/data/wordpress/*
	sudo rm -rf /home/elopez-u/data/mariadb/*

re: down up

.PHONY: up down build logs clean fclean re
