VENV = venv
export VIRTUAL_ENV := $(abspath ${VENV})
export PATH := ${VIRTUAL_ENV}/bin:${PATH}

${VENV}:
	python3 -m venv $@
	. venv/bin/activate
	pip install --upgrade -r requirements.txt
python-reqs: requirements.txt | ${VENV}
	pip install --upgrade -r requirements.txt


clean:
	rm -rf venv
	find -iname "*.pyc" -delete
test:
	coverage run -m pytest
	coverage report
	coverage html
codecheck:
	flake8 --exclude=venv* --statistics
