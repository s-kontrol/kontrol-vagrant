.PHONY: setup run

all: setup run

setup:
	python3 -m venv venv
	source venv/bin/activate && pip install -r requirements.txt

run:
	source venv/bin/activate && ansible-playbook apply-hosts.yml
