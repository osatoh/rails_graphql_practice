RAILS = web

help:
	cat Makefile

init: build up

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

db-reset:
	docker-compose run --rm $(RAILS) rails db:migrate:reset
	docker-compose run --rm $(RAILS) rails db:seed

bundle:
	docker-compose run --rm $(RAILS) bundle install