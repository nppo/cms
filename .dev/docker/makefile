docker-up: docker-init
	docker-compose -f .dev/docker/docker-compose.yml -f .dev/docker/docker-compose.override.yml up

docker-up-fresh: docker-init
	docker-compose -f .dev/docker/docker-compose.yml -f .dev/docker/docker-compose.override.yml up --force-recreate --build --remove-orphans --renew-anon-volumes

docker-down: docker-init
	docker-compose -f .dev/docker/docker-compose.yml -f .dev/docker/docker-compose.override.yml down

docker-in: docker-init
	docker-compose -f .dev/docker/docker-compose.yml -f .dev/docker/docker-compose.override.yml exec php bash

docker-init:
	cp .dev/docker/resources/.env .dev/docker/.env
	sed -i 's/=/=$(shell basename `pwd`)/g' .dev/docker/.env
	cp .dev/docker/resources/docker-compose.override.yml .dev/docker/docker-compose.override.yml
