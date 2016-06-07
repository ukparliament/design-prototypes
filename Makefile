run:
	docker-compose build
	docker-compose up -d
	@echo Browse to http://`eval docker-machine ip`

destroy:
	docker-compose down