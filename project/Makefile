COMPOSE_FILE = srcs/docker-compose.yml
CERTS_DIR = srcs/requirements/nginx/certs

all: up

certs:
	mkdir -p $(CERTS_DIR)
	if [ ! -f $(CERTS_DIR)/server.crt ] || [ ! -f $(CERTS_DIR)/server.key ]; then \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout $(CERTS_DIR)/server.key \
			-out $(CERTS_DIR)/server.crt \
			-subj "/CN=elopez.42.fr"; \
	fi

up: certs
	docker compose -f $(COMPOSE_FILE) up --build -d

down:
	docker compose -f $(COMPOSE_FILE) down

re: down up

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

clean:
	docker compose -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans
	rm -rf $(CERTS_DIR)
