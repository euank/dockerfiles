##  What is it?

This Dockerfile creates a minimal route53 specific lets-encrypt certificate issuer.

You give it AWS credentials and a domain whose records are managed in AWS Route53, and it spits out a certificate.


## Usage

The following example shows all common options.

Please note that the `/certs` and `/le-secrets` directories bindmounted into the container should be the same each time.

The certificate after a successful run will be found in `/certs/ssl.{key,pem}`.

```
docker run -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
		-e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
		-e LE_EMAIL=test-le@euank.com \
		-e STAGING=true \
		-v $(pwd)/ssl:/certs \
		-v $(pwd)/le-secrets/:/le-secrets \
		-e DOMAINS="test-le.euank.com test-le-2.euank.com" \
		euank/r53-lets-encrypt
```
