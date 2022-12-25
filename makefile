ifneq (,$(wildcard ./.env))
include .env
export
ENV_FILE_PARAM = --env-file .env

endif

build:
	docker compose build

makemigrations:
	docker compose exec app python manage.py makemigrations

migrate:
	docker compose exec app python manage.py migrate

superuser:
	docker compose exec app python manage.py createsuperuser 

up:
	docker compose up -d

down:
	docker compose down

create-buckets:
	docker compose up createbuckets -d

black-check:
	docker compose exec app black --check --exclude=migrations .

black-diff:
	docker compose exec app black --diff --exclude=migrations .

black:
	docker compose exec app black --exclude=migrations .

isort-check:
	docker compose exec app isort . --check-only --skip env --skip migrations

isort-diff:
	docker compose exec app isort . --diff --skip env --skip migrations

isort:
	docker compose exec app isort . --skip env --skip migrations