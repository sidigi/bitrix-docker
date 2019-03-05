up: docker-up

docker-up:
	docker-compose up --build -d

docker-clear:
	docker-compose down --remove-orphans

bitrix-setup: perm
	docker-compose exec php-fpm-cli wget http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php -O bitrixsetup.php

bitrix-restore-download: perm
	docker-compose exec php-fpm-cli wget $(url)

bitrix-restore: bitrix-restore-download perm
	docker-compose exec php-fpm-cli wget http://www.1c-bitrix.ru/download/scripts/restore.php -O restore.php

bitrix-setup:
	docker-compose exec php-fpm-cli wget http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php

composer:
	docker-compose exec php-fpm-cli composer install

perm:
	sudo chgrp -R ${USER} www
	sudo chown -R ${USER}:${USER} www
	sudo chmod -R ug+rwx www