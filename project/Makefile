COMPOSE_FILE = srcs/docker-compose.yml

all: up

up:
	docker compose -f $(COMPOSE_FILE) up --build -d

down:
	docker compose -f $(COMPOSE_FILE) down

re: down up

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

clean:
	docker compose -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans
