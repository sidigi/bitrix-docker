## В сборке
- PHP 7.3 (opcache, xdebug)
- nginx 1.14
- mysql 5.7
- smtp (иммитация, перехват писем небольшим скриптом на go)
- mailhog для просмотра писем

Соответствует всем тестам на БУС

## Установка зависимостей
- Git
```
sudo apt-get install -y git
```
- Docker
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker ${USER} 
```

- Docker compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Начало работы
- Склонируйте репозиторий bitrix-docker
```
git clone https://github.com/sidigi/bitrix-docker.git
```

- Выполните настройку окружения

Скопируйте файл `.env.example` в `.env`

```
cp .env.example .env
```

- Запустите bitrix-docker
```
make up
```

или если нет поддержки Makefile:

```
docker-compose up --build -d
```

## Установка bitrix

Bitrix проект нужно расположить в папке `www`

### Установка через `bitrixsetup.php`
- Скачайте `bitrixsetup.php` (файл будет скачан с официального сайта автоматически)
```
make bitrix-setup
```

- Установка будет доступна по адресу `http://10.100.0.21`
> При установке `bitrix` необходимо в окне создания базы данных в графе "Сервер" 
`localhost` заменить на `mysql` (так как контейнер поднятый в сети имеет название `mysql`)

### Востановление через `restore.php`
- Скачайте `restore.php` (файл будет скачан с официального сайта автоматически)
```
make bitrix-restore url=<ссылка для переноса>
```

- Востановление будет доступна по адресу `http://10.100.0.21/restore.php`
> При востановлениии необходимо в окне создания базы данных в графе "Сервер" 
`localhost` заменить на `mysql` (так как контейнер поднятый в сети имеет название `mysql`)

## Использование

### Mailhog 
Mailhog (почтовый клиент) все письма из системы будут отображены в почтовом клиенте. Доступен по адресу http://10.100.0.1:8025/
