.PHONY: init start stop logs k8s-up k8s-down build clean help

help:
	@echo "Available commands:"
	@echo "  make init        - Clone all repos and prepare environment"
	@echo "  make build       - Build all Docker images"
	@echo "  make start       - Start full stack (Docker Compose)"
	@echo "  make stop        - Stop all services"
	@echo "  make logs        - Follow logs for all containers"
	@echo "  make k8s-up      - Deploy entire stack to Kubernetes"
	@echo "  make k8s-down    - Delete Kubernetes deployment"
	@echo "  make clean       - Remove containers, images, volumes"

init:
	./setup.sh

start:
	docker compose up --build -d

stop:
	docker compose down

build:
	docker compose build

logs:
	docker compose logs -f

clean:
	docker compose down -v --rmi all

k8s-up:
	kubectl apply -f k8s/

k8s-down:
	kubectl delete -f k8s/