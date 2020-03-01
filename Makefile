ENV=$(CURDIR)/.env

env:
	python3 -m venv $(ENV)
	$(ENV)/bin/pip install --upgrade setuptools wheel twine

build:
	$(ENV)/bin/python setup.py sdist bdist_wheel

# Upload to test pipy: https://test.pypi.org/project/trench
testupload:
	$(ENV)/bin/twine upload --repository-url https://test.pypi.org/legacy/ dist/*

upload:
	$(ENV)/bin/twine upload dist/*
