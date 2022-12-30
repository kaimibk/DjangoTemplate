ifneq (,$(wildcard ./dev.env))
include dev.env
export
ENV_FILE_PARAM = --env-file dev.env

endif

build:
	docker compose build

up:
	docker compose up -d

up-monitor:
	docker compose --profile monitoring up -d

down:
	docker compose down

down-monitor:
	docker compose --profile monitoring down

migrations:
	docker compose exec app python manage.py makemigrations

migrate:
	docker compose exec app python manage.py migrate

superuser:
	docker compose exec app python manage.py createsuperuser

collectstatic:
	docker compose exec app python manage.py collectstatic

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