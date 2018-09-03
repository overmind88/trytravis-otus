# overmind88_microservices
overmind88 microservices repository

# ДЗ №12

Что было сделано:
- Настроены travis и оповещения в slack
- Установлены docker, docker-compose, docker-machine
- Использованы основные команды docker по управлению контейнерами и образами

# ДЗ №13

Что было сделано:
- Настроил docker-machine на GCP
- Сравнил выводы docker run --rm -ti tehbilly/htop и docker run --rm --pid host -ti tehbilly/htop, во втором случае htop отображается для хоста
- Собрал образ dind, запустил его, запустил в нём контейнер hello-world
- Собрал образ для приложения, запустил контейнер с приложением, залил образ в docker-hub, проверил работоспособность образа в локальном докере
- Задание со звёздочкой: инфраструктурный репозиторий с packer, ansible и terraform

# ДЗ №14

Что было сделано:
- Контейнеры для каждого сервиса
-

gcloud init

export GOOGLE_PROJECT=docker-213923

docker-machine create --driver google \
--google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
--google-machine-type n1-standard-1 \
--google-zone europe-west1-b \
docker-host

docker-machine ls

eval $(docker-machine env docker-host)

docker pull mongo:latest

gcloud compute firewall-rules create reddit-app \
 --allow tcp:9292 \
 --target-tags=docker-machine \
 --description="Allow PUMA connections" \
 --direction=INGRESS


docker build -t overmind88/post:1.0 ./post-py

docker build -t overmind88/comment:1.0 ./comment

docker build -t overmind88/ui:1.0 ./ui

docker build -f ./ui/Dockerfile.1 -t overmind88/ui:2.0 ./ui


docker network create reddit

docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post overmind88/post:1.0
docker run -d --network=reddit --network-alias=comment overmind88/comment:1.0
docker run -d --network=reddit -p 9292:9292 overmind88/ui:1.0
docker run -d --network=reddit -p 9292:9292 overmind88/ui:2.0

docker run -d --network=reddit --network-alias=mongo_database_post --network-alias=mongo_database_comment mongo:latest
docker run -d --network=reddit --network-alias=reddit_post overmind88/post:1.0
docker run -d --network=reddit --network-alias=reddit_comment overmind88/comment:1.0
docker run -d --network=reddit -p 9292:9292 overmind88/ui:1.0

--env -e
