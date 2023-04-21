IMAGE_NAME := rexuiz-server

.PHONY: build

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker compose up

clean:
	rm -rf config/*
	git restore config/server.cfg
	