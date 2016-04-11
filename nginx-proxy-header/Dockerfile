FROM quay.io/euank/openresty-nginx:latest

COPY ./make-nginx-conf.sh /make-nginx-conf.sh
RUN chmod +x /make-nginx-conf.sh

ENTRYPOINT /make-nginx-conf.sh
