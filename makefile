# Makefile
include ./.dev/docker/makefile

SHELL := /bin/bash
.PHONY: list
.DEFAULT_GOAL = list
.RECIPEPREFIX = >

init: env-local git-init docker-init

list:
> @LC_ALL=C $(MAKE) -pRrq -f $(MAKEFILE_LIST) -f ./makefile : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

banner:
> @clear
> @echo " _____ _____ _____ _____ "
> @echo "|  _  |  _  |     |_   _|"
> @echo "|   __|     |  |  | | |  "
> @echo "|__|  |__|__|___ \| |_|  "
> @echo "                         "

env-local:
> cp .dev/envs/.env.local .env

git-init:
> cp .dev/git/hooks/prepare-commit-msg .git/hooks/prepare-commit-msg
> cp .dev/git/hooks/commit-msg .git/hooks/commit-msg
