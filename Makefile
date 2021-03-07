.PHONY: test

deps:
<<<<<<< HEAD
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test
=======
	pip install -r requirements.txt
	pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test --verbose -s
>>>>>>> 19b9309fb99bf482c968f50b2311c2a8ddad9f18

run:
	python main.py

<<<<<<< HEAD
test:
	PYTHONPATH=. py.test
	PYTHONPATH=. py.test --verbose -s

docker_build:
		docker build -t hello-world-printer .

docker_run: docker_build
		docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

USERNAME=tomwisdocker
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
		@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
		docker tag hello-world-printer $(TAG); \
		docker push $(TAG); \
		docker logout;

test_smoke:
	curl --fail 127.0.0.1:5000 \

test_smoke_http:
		curl -s -o /dev/null -w "%{http_code}" --fail 127.0.0.1:5000 \
=======
lint:
	flake8 hello_world test

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
	--name hello-world-printer-dev \
	-p 5000:5000 \
	-d hello-world-printer

USERNAME=mgrzmil
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;

test_smoke:
	curl -s -o /dev/null -w "%{http_code}" --fail 127.0.0.1:5000
>>>>>>> 19b9309fb99bf482c968f50b2311c2a8ddad9f18
