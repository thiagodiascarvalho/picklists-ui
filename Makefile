.PHONY: run

run:
	docker-compose run --rm app sh -c "cd /home/build && git config --global --add safe.directory /home/flutter/flutter-sdk && flutter build web --web-renderer html"


build:
	docker-compose run --rm app sh -c "flutter build web --web-renderer html"