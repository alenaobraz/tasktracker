DC = docker compose -f docker/docker-compose.yml

.PHONY: up down restart build logs ps \
        up-php up-nginx up-db \
        down-php down-nginx down-db \
        restart-php restart-nginx restart-db \
        logs-php logs-nginx logs-db \
        shell-php shell-db \
        init migrate

## Все контейнеры
up:
	$(DC) up -d

down:
	$(DC) down

restart:
	$(DC) restart

build:
	$(DC) build

ps:
	$(DC) ps

logs:
	$(DC) logs -f

## php-fpm
up-php:
	$(DC) up -d php-fpm

down-php:
	$(DC) stop php-fpm

restart-php:
	$(DC) restart php-fpm

logs-php:
	$(DC) logs -f php-fpm

shell-php:
	$(DC) exec php-fpm sh

## nginx
up-nginx:
	$(DC) up -d nginx

down-nginx:
	$(DC) stop nginx

restart-nginx:
	$(DC) restart nginx

logs-nginx:
	$(DC) logs -f nginx

## db
up-db:
	$(DC) up -d db

down-db:
	$(DC) stop db

restart-db:
	$(DC) restart db

logs-db:
	$(DC) logs -f db

shell-db:
	$(DC) exec db psql -U $${POSTGRES_USER:-app} -d $${POSTGRES_DB:-tasktracker}

## Symfony / Doctrine
init:
	$(DC) exec php-fpm php bin/console doctrine:schema:update --force --complete=false

migrate:
	$(DC) exec php-fpm php bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration