#!/usr/bin/env bash

docker-compose --file development.yml down --rmi all --volumes --remove-orphans
# docker-compose --file development.yml up --force-recreate --always-recreate-deps --build --renew-anon-volumes --remove-orphans --detach
docker-compose --file development.yml up --force-recreate --always-recreate-deps --build --renew-anon-volumes --remove-orphans
