FROM debian

ENV VERSION=7.2.12

RUN apt-get update
RUN apt-get install -y cmake wget tar gzip bash git bzip2
RUN apt-get install -y pkg-config libssl-dev libpcre3-dev

RUN cd / && wget -O atheme-services.tar.xz https://github.com/atheme/atheme/releases/download/v${VERSION}/atheme-services-v${VERSION}.tar.xz \
    && tar xvf atheme-services.tar.xz \
    && rm -f /atheme-services*.tar.xz \
    && cd /atheme-* \
    && ./configure --enable-ssl --enable-contrib --with-pcre --disable-nls --prefix=/atheme/ \
    && make && make install \
    && rm -rf /atheme-services*

# Because having a volume at a path where data already exists is fragile, make
# /atheme/etc the "real" data and in the entrypoint load it from the data in
# /atheme/base-etc. Trust me, this is better.
RUN mkdir -p /atheme/base-etc
COPY conf/atheme.conf /atheme/base-etc/atheme.conf
COPY conf/atheme.motd /atheme/base-etc/atheme.motd
COPY entrypoint.sh /entrypoint.sh

# Backup this directory, it contains your services.db
VOLUME /atheme/etc

ENTRYPOINT /entrypoint.sh
