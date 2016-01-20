#!/bin/bash

docker-compose run --rm app gem install bundler
docker-compose run --rm app bundle

