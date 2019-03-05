up: docker-up

docker-up:
	docker-compose up --build -d

docker-clear:
	docker-compose down --remove-orphans

bitrix-setup:
	docker-compose exec php-fpm-cli wget http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php

composer:
	docker-compose exec php-fpm-cli composer install