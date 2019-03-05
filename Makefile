up: docker-up

docker-up:
	docker-compose up --build -d

docker-clear:
	docker-compose down --remove-orphans

composer:
	docker-compose exec php-fpm-cli composer install