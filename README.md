# pymongo-api

## Как запустить

Для запуска конкретной конфигурации сервиса осуществите следующие действия:

- откройте терминал;
- сохраните путь к текущей директории (для упрощения запуска разных конфигураций вручную):
```shell
export PROJECT_ROOT_DIR=$(pwd)
```

- перейдите в директорию с нужно конфигурацией сервиса с помощью одной из команд:

```shell
cd $PROJECT_ROOT_DIR/mongo-mono  # Одиночный экземпляр MongoDB и API-сервис
```

```shell
cd $PROJECT_ROOT_DIR/mongo-sharding  # Шардированная MongoDB и API-сервис
```

```shell
cd $PROJECT_ROOT_DIR/mongo-sharding-repl  # Шардированная MongoDB c репликацией и API-сервис
```

```shell
cd $PROJECT_ROOT_DIR/mongo-sharding-repl-cache  # Шардированная MongoDB c репликацией и кэшем Redis и API-сервис
```
- запустите docker compose файл
```shell
docker compose up -d
```
- сконфигурируйте инстансы базы данных путем запуска имеющихся в каждой из директорий скрипта:
```shell
sh ./scripts/init_service.sh
```

- при необходимости наполните базу мок-данными:
```shell
sh ./scripts/fill_db.sh
```

## Как проверить проект на локальной машине

Откройте в браузере http://localhost:8080
