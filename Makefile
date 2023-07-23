
install:
	poetry install

code-quality:
	poetry install
	pip install black
	poetry run black .


.PHONY: tests
tests:
	poetry run pytest -v \
		--html=report.html \
		--self-contained-html \
		--cov=.

show-coverage:
	poetry run coverage report -m

coverage-report:
	poetry run coverage html