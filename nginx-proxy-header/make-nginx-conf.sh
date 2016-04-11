#!/bin/sh

cat > /usr/local/openresty/nginx/conf/nginx.conf <<EOF
worker_processes  1;
events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    server {
        listen       8081;
        server_name  localhost;
        location / {
            more_set_input_headers '${EXTRA_HEADER}';
            proxy_pass http://${PROXY_TO:-127.0.0.1:80};
        }
    }
}
EOF

exec /usr/local/openresty/nginx/sbin/nginx -g 'daemon off;'
