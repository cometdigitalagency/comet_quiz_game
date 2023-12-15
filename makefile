start_docker:
	cd comet_quiz_game_server && docker compose up --build --detach

start_server:
	cd comet_quiz_game_server && dart bin/main.dart

generate:
	cd comet_quiz_game_server && serverpod generate

update_serverpod_tables: 
	cd comet_quiz_game_server && docker compose run -T --rm postgres env PGPASSWORD=${PGPASSWORD} psql -h postgres -U postgres -d comet_quiz_game < generated/tables-serverpod.pgsql

update_tables:	
	cd comet_quiz_game_server && docker compose run -T --rm postgres env PGPASSWORD=${PGPASSWORD} psql -h postgres -U postgres -d comet_quiz_game < generated/tables.pgsql

start_app:
	cd comet_quiz_game_flutter && flutter run -d web-server --web-port 8083 --web-hostname 0.0.0.0

