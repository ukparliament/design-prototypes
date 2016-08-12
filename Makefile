NAME = ukpds/design-prototypes

# GO_PIPELINE_COUNTER is the pipeline number, passed from our build agent.
GO_PIPELINE_COUNTER?="unknown"
DOCKER_SWARM_URL?="unknown"

# Construct the image tag.
VERSION=0.1.$(GO_PIPELINE_COUNTER)

run:
	docker-compose build
	docker-compose up -d

runalone:
	docker run -p 80:3000 $(NAME)
	# Container port 3000 is specified in Dockerfile
	# Browse to http://localhost:80 to see the application

run-docker-cloud:
	docker-cloud stack up

runalone-docker-cloud:
	docker-cloud stack up -f docker-cloud.standalone.yml

rebuild:
	docker-compose down
	docker-compose up -d

clean:
	docker rmi $$(docker images -q)

test:
	docker-compose run web rake spec
	docker-compose down

build:
	docker-compose build

push:
	docker build -t $(NAME):$(VERSION) .
	docker push $(NAME):$(VERSION)
	docker rmi $(NAME):$(VERSION)

deploy-ci:
	export DOCKER_HOST=$(DOCKER_SWARM_URL) && export IMAGE_NAME=$(NAME):$(VERSION) && docker-compose -f docker-compose.ci.yml down && docker-compose -f docker-compose.ci.yml up -d



