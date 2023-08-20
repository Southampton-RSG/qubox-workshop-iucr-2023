all:

pull:
	docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" pull

up:
	docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" up -d

%-up:
	docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" up -d $*

%-logs:
	docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" logs -f $*

down:
	docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" down

purge:
	docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" down -v
