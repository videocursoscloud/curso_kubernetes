include vars.rc
IMAGE_VERSION=$(shell ./version.sh)

all:
	make login
	make build
	make test
	make tag
	make publish
	make clean
build:
	docker build --no-cache -t ${APP_NAME}:${IMAGE_VERSION} .
login:
	aws ecr get-login --no-include-email --region eu-west-1|sh
tag:
	docker tag ${APP_NAME}:${IMAGE_VERSION} ${REPO_URL}:${IMAGE_VERSION}
	docker tag ${APP_NAME}:${IMAGE_VERSION} ${REPO_URL}:latest
test:
	TEST_GRACE_PERIOD=${TEST_GRACE_PERIOD} APP_NAME=${APP_NAME} IMAGE_VERSION=${IMAGE_VERSION} PORT=${PORT} ./scripts/run_tests.sh
publish:
	docker push ${REPO_URL}:latest
	docker push ${REPO_URL}:${IMAGE_VERSION}
clean:
	docker rmi 05makefiles:${IMAGE_VERSION}
