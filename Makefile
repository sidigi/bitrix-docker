up: docker-up

docker-up:
	docker-compose up --build -d

docker-clear:
	docker-compose down --remove-orphans
	sudo rm -rf www/bitrix

permissions:
	sudo chmod 777 www/bitrix

storage-permissions:
	sudo chown 777 storage

composer:
	docker-compose exec php-fpm-cli composer install