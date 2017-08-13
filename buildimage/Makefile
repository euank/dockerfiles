all:
	docker build -t euank/alpine-build:$(shell git rev-parse --short HEAD) .
	docker tag euank/alpine-build:$(shell git rev-parse --short HEAD) euank/alpine-build:latest

push:
	docker push euank/alpine-build:$(shell git rev-parse --short HEAD)
	docker push euank/alpine-build:latest
	echo "Built euank/alpine-build:$(shell git rev-parse --short HEAD)"
