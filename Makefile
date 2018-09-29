.PHONY: run build

build:
	docker build --rm -t puckel/docker-airflow .

run: build
	#docker run -d -p 8080:8080 puckel/docker-airflow  #orig
	docker-compose -f docker-compose-LocalExecutor.yml up -d
	@echo airflow running on http://localhost:8080

kill:
	@echo "Killing docker-airflow containers"
	docker kill $(shell docker ps -q --filter name=docker-airflow_webserver_1)

tty:
	docker exec -i -t $(shell docker ps -q --filter name=docker-airflow_webserver_1) /bin/bash