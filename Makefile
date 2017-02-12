APP_NAME = designprototypes
AWS_ACCOUNT_ID?="unknown" # an env var set in GoCD GUI

# GO_PIPELINE_COUNTER is the pipeline number, passed from our build agent.
GO_PIPELINE_COUNTER?="unknown"

# Construct the image tag.
VERSION=0.2.$(GO_PIPELINE_COUNTER)

# ECS-related
ECS_CLUSTER = ecs
AWS_REGION = eu-west-1
IMAGE = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(APP_NAME)

build:
	docker build -t $(IMAGE):$(VERSION) -t $(IMAGE):latest .

# Container port 3000 is specified in Dockerfile
# Browse to http://localhost:80 to see the application
run:
	docker run -p 80:3000 $(IMAGE)

dev:
	docker run -p 80:3000 -v ${PWD}:/opt/$(APP_NAME) $(IMAGE)

test: build
	docker run $(IMAGE) bundle exec rake

push:
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest
	docker rmi $(IMAGE):$(VERSION)
	docker rmi $(IMAGE):latest

# http://serverfault.com/questions/682340/update-the-container-of-a-service-in-amazon-ecs?rq=1
deploy-ci:
	aws ecs register-task-definition --cli-input-json file://./aws_ecs/task-definition.json
	aws ecs update-service --service $(APP_NAME) --cluster $(ECS_CLUSTER) --region $(AWS_REGION) --task-definition $(APP_NAME)







# Old targets kept for references: docker-compose, Docker Swarm, Docker Cloud, etc.
run-with-docker-compose:
	docker-compose build
	docker-compose up -d

run-docker-cloud:
	docker-cloud stack up

runalone-docker-cloud:
	docker-cloud stack up -f docker-cloud.standalone.yml

clean:
	docker rmi $$(docker images -q)

deploy-swarm:
	export DOCKER_HOST=$(DOCKER_SWARM_URL) && export IMAGE_NAME=$(IMAGE):$(VERSION) && docker-compose -f docker-compose.ci.yml down && docker-compose -f docker-compose.ci.yml up -d


