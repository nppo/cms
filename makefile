# Makefile
include ./.dev/docker/makefile

SHELL = /bin/bash
.PHONY = list
.DEFAULT_GOAL = welcome

init: env-local git-init docker-init

welcome: list

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(MAKEFILE_LIST) -f ./makefile : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

env-local:
	cp .dev/envs/.env.local .env

git-init:
	cp .dev/git/hooks/prepare-commit-msg .git/hooks/prepare-commit-msg
	cp .dev/git/hooks/commit-msg .git/hooks/commit-msg

app-init: app-config-load app-user-seed

app-user-seed:
	docker-compose -f .dev/docker/docker-compose.yml -f .dev/docker/docker-compose.override.yml exec node ./node_modules/.bin/strapi admin:reset-user-password --email=admin@way2web.nl --password=Way2web123!

app-config-save:
	docker-compose -f .dev/docker/docker-compose.yml -f .dev/docker/docker-compose.override.yml exec node ./node_modules/.bin/strapi config:dump -p -f app/config.json

app-config-load:
	docker-compose -f .dev/docker/docker-compose.yml -f .dev/docker/docker-compose.override.yml exec node ./node_modules/.bin/strapi config:restore -f app/config.json
