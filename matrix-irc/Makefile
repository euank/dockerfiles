all:
	docker build -t euank/matrix-irc:$(shell git rev-parse --short HEAD) .
	docker tag euank/matrix-irc:$(shell git rev-parse --short HEAD) euank/matrix-irc:latest

push:
	docker push euank/matrix-irc:$(shell git rev-parse --short HEAD)
	docker push euank/matrix-irc:latest
	echo "Built euank/matrix-irc:$(shell git rev-parse --short HEAD)"
