VENV_NAME=env
REQUIREMENTS=requirements.txt
DOCKER_COMPOSE=docker-compose.yml

.PHONY: help install setup update add clean start stop restart migrate migrations

help:
	@echo "Usage: make [COMMAND]"
	@echo ""
	@echo "Commands:"
	@echo "  install         Installs dependencies"
	@echo "  setup           Sets up a new virtual environment and activates it"
	@echo "  update          Updates the virtual environment and requirements"
	@echo "  add             Adds new dependency to requirements.txt"
	@echo "  clean           Cleans the virtual environment and removes Docker containers"
	@echo "  start           Starts the Django server"
	@echo "  stop            Stops the Django server"
	@echo "  restart         Restarts the Django server"
	@echo ""
	@echo "Example usage:"
	@echo "  make install"
	@echo "  make setup"
	@echo "  make start"
	@echo "  make stop"
	@echo "  make restart"

install:
	@echo "Installing dependencies..."
	python -m venv $(VENV_NAME)
	. $(VENV_NAME)/bin/activate && pip install -r $(REQUIREMENTS)
	@echo "Install complete."

setup:
	@echo "Setting up virtual environment..."
	python -m venv $(VENV_NAME)
	@echo "Setup complete."

update:
	@echo "Updating virtual environment..."
	. $(VENV_NAME)/bin/activate && pip install -r $(REQUIREMENTS)
	@echo "Update complete."

add:
ifndef package
	@echo "Package not specified. Usage: make add package=<package-name>"
else
	@echo "Adding dependency $(package) to requirements.txt..."
	echo $(package) >> $(REQUIREMENTS)
	@echo "Dependency added."
endif

clean:
	@echo "Cleaning virtual environment and Docker containers..."
	- . $(VENV_NAME)/bin/deactivate
	rm -rf $(VENV_NAME)
	docker-compose -f $(DOCKER_COMPOSE) down
	@echo "Clean complete."

start:
	@echo "Starting Django server..."
	. $(VENV_NAME)/bin/activate && docker-compose -f $(DOCKER_COMPOSE) up -d
	. $(VENV_NAME)/bin/activate && python manage.py runserver

stop:
	@echo "Stopping Django server..."
	. $(VENV_NAME)/bin/activate && docker-compose -f $(DOCKER_COMPOSE) down

restart:
	@echo "Restarting Django server..."
	. $(VENV_NAME)/bin/activate && docker-compose -f $(DOCKER_COMPOSE) restart

migrate:
	@echo "Running Django migrations..."
	. $(VENV_NAME)/bin/activate && python manage.py migrate
	@echo "Migrations complete."

migrations:
	@echo "Creating new migration..."
	. $(VENV_NAME)/bin/activate && python manage.py makemigrations
	@echo "New migration created."

