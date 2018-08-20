FROM golang:1.10.3-alpine as builder

ENV LEGO_VERSION=v1.0.1
RUN apk add --update git && mkdir -p /go/src/github.com/xenolf

RUN git clone https://github.com/xenolf/lego /go/src/github.com/xenolf/lego
WORKDIR /go/src/github.com/xenolf/lego
RUN git checkout "${LEGO_VERSION}"
RUN go build -ldflags="-s -X main.version=${LEGO_VERSION}"

FROM alpine
COPY --from=builder /go/src/github.com/xenolf/lego/lego /usr/bin/lego
RUN apk add --update bash ca-certificates openssl

WORKDIR /le
RUN mkdir /certs/ /le/certs
# Output
VOLUME ["/certs/"]
# Account private key
VOLUME ["/le-secrets/"]

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
