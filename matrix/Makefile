# https://packages.matrix.org/debian/pool/main/m/matrix-synapse-py3/
SYNAPSE_VERSION:=0.99.4
SYNAPSE_DEB_VERSION:=$(SYNAPSE_VERSION)+stretch1

DOCKERFILE_VERSION:=4

all:
	SYNAPSE_VERSION=$(SYNAPSE_DEB_VERSION) gotmpl Dockerfile.tmpl > Dockerfile
	docker build -t euank/synapse:$(SYNAPSE_VERSION)-$(DOCKERFILE_VERSION) .
	echo Built euank/synapse:$(SYNAPSE_VERSION)-$(DOCKERFILE_VERSION)

push: 
	docker push euank/synapse:$(SYNAPSE_VERSION)-$(DOCKERFILE_VERSION)
