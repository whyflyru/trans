.PHONY: clean
clean: clean-build clean-pyc clean-test clean-cache ## remove all build, test, coverage and Python artifacts

.PHONY: clean-build
clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

.PHONY: clean-pyc
clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

.PHONY: clean-test
clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -rf coverage/
	rm -fr htmlcov/
	rm -rf reports/
	rm -fr .pytest_cache

.PHONY: clean-cache
clean-cache: ## remove pip cache
	rm -rf .cache

.PHONY: release
release: dist ## package and upload a release
	twine upload dist/*

.PHONY: dist
dist: clean ## builds source and wheel package
	python setup.py sdist
	ls -l dist