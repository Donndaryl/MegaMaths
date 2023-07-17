
install:
	poetry install

code-quality:
	poetry run black --check .


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