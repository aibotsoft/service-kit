.EXPORT_ALL_VARIABLES:
APP_NAME=service-kit
DOCKER_USERNAME=aibotsoft
CGO_ENABLED=0
#GOOS=linux
GOARCH=amd64

linux_build:
	GOOS=linux go build -o dist/service main.go

build:
	go build -o dist/service main.go

run:
	go run main.go

test:
	go test ./...

run_build:
	dist/service

docker_build:
	docker image build -f Dockerfile -t $$DOCKER_USERNAME/$$APP_NAME .

docker_run_rm:
	docker run --rm -t $$DOCKER_USERNAME/$$APP_NAME

docker_login:
	docker login -u $$DOCKER_USERNAME -p $$DOCKER_PASSWORD

docker_push:
	docker push $$DOCKER_USERNAME/$$APP_NAME

docker_deploy: linux_build docker_build docker_login docker_push

kube_deploy:
	kubectl apply -f k8s/

envtest:
	echo $$APP_NAME/$$APP_NAME > export AAA; \
	echo $$AAA
