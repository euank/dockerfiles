FROM debian

ENV VERSION=7.2.6

RUN apt-get update
RUN apt-get install -y cmake wget tar gzip bash git bzip2
RUN apt-get install -y pkg-config libssl-dev libpcre3-dev

RUN cd / && wget -O atheme-services.tar.bz2 https://atheme.github.io/downloads/atheme-services-${VERSION}.tar.bz2 \
    && tar xvf atheme-services.tar.bz2 \
    && rm -f /atheme-services*.tar.bz2 \
    && cd /atheme-services* \
    && ./configure --enable-ssl --enable-contrib --with-pcre --disable-nls --prefix=/atheme/ \
    && make && make install \
    && rm -rf /atheme-services*

COPY conf/atheme.conf /atheme/etc/atheme.conf
COPY conf/atheme.motd /atheme/etc/atheme.motd
COPY entrypoint.sh /entrypoint.sh

# Backup this directory, it contains your services.db
VOLUME /atheme/etc

ENTRYPOINT /entrypoint.sh
