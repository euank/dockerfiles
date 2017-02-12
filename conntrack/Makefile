all:
	docker build -t euank/conntrack:latest .
	docker tag euank/conntrack:latest euank/conntrack:$(shell git rev-parse --short HEAD)

push:
	docker push euank/conntrack:latest
	docker push euank/conntrack:$(shell git rev-parse --short HEAD)
