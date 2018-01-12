build:
	docker build -t euank/r53-lets-encrypt .

test:
	docker run -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
		-e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
		-e LE_EMAIL=test-le@euank.com \
		-e STAGING=true \
		-v ${PWD}/ssl:/certs \
		-v ${PWD}/le-secrets/:/le-secrets \
		-e DOMAINS="test-le.euank.com test-le-2.euank.com" \
		euank/r53-lets-encrypt

push:
	docker push euank/r53-lets-encrypt
