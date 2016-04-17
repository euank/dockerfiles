FROM alpine
RUN apk update && sync
RUN apk add git openssl bash curl sed grep py-pip jq
RUN pip install awscli
RUN git clone https://github.com/lukas2511/letsencrypt.sh.git le
WORKDIR /le
COPY ./hook.sh /le/hook.sh
COPY ./config.sh /le/config.sh
RUN mkdir /ssl
VOLUME ["/ssl"]
VOLUME ["/le-secrets"]
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
