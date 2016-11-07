FROM debian:latest

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -y software-properties-common debian-keyring curl
RUN curl https://matrix.org/packages/debian/repo-key.asc | apt-key add -
RUN add-apt-repository -y http://matrix.org/packages/debian/
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y matrix-synapse libpq-dev
    
RUN mkdir -p /data/{media,uploads} /secret /conf /base-conf/
VOLUME /data
VOLUME /conf
VOLUME /secret

ADD log.config /base-conf/log.config

RUN useradd -m matrix
USER matrix

CMD ["python", "-m", "synapse.app.homeserver", "--config-path", "/conf/homeserver.yaml"]
