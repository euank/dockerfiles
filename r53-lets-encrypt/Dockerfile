FROM alpine
RUN apk update && sync
RUN apk add git openssl bash curl sed grep py-pip jq diffutils
RUN pip install awscli
RUN git clone https://github.com/lukas2511/dehydrated.git le
WORKDIR /le
COPY ./hook.sh /le/hook.sh
COPY ./config.sh /le/config.sh
RUN mkdir /certs/ /le/certs
# Output
VOLUME ["/certs/"]
# Account private key
VOLUME ["/le-secrets/"]
# Historical certs, so it knows if it needs to cron or not
VOLUME ["/le/certs/"]
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
