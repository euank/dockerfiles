# https://matrix.org/packages/debian/pool/main/m/matrix-synapse/
SYNAPSE_VERSION:=0.19.2-1

DOCKERFILE_VERSION:=1

all:
	SYNAPSE_VERSION=$(SYNAPSE_VERSION) gotmpl Dockerfile.tmpl > Dockerfile
	docker build -t euank/synapse:$(SYNAPSE_VERSION)-$(DOCKERFILE_VERSION) .
	echo Built euank/synapse:$(SYNAPSE_VERSION)-$(DOCKERFILE_VERSION)

push: 
	docker push euank/synapse:$(SYNAPSE_VERSION)-$(DOCKERFILE_VERSION)
