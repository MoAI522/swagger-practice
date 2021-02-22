.PHONY: local
local:
	docker run -d --name swagger-practice-app -p 8080:8080 swagger-practice

.PHONY: down
down:
	docker stop swagger-practice-app
	docker rm swagger-practice-app

.PHONY: build
build:
	docker build . -t swagger-practice

.PHONY: build-local
build-local:
	make build
	make local

.PHONY: edit
edit:
	docker run -d -p 9200:8080 --name swagger-practice-editor swaggerapi/swagger-editor

.PHONY: edit-down
edit-down:
	docker stop swagger-practice-editor
	docker rm swagger-practice-editor
