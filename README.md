## В сборке
- PHP 7.3 (opcache)
- nginx 1.14
- mysql 5.7

## Установка
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
git clone git@github.com:sidigi/bitrix-docker.git
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

Bitrix проект нужно расположить в папке `www`