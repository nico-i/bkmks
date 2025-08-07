.PHONY: test build

dev:
	cd ./src && uv run -m presentation.cli

build:
	make NAME=bkmks build-no-name

build-no-name:
	uv run pyinstaller --onefile -n $(NAME) --path src --paths .venv/lib/python3.12/site-packages src/presentation/cli/__main__.py 

run:
	./dist/bkmks

test:
	uv run pytest

install:
	uv sync

lint:
	uv tool run ruff check

fmt:
	uv tool run ruff format src