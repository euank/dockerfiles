#!/bin/bash
set -eux

config_data=""
# Only supported env var for now
if [[ "${NGROK_AUTH_TOKEN-}" != "" ]]; then
  config_data=<<EOF
$config_data
authtoken: "${NGROK_AUTH_TOKEN}"
EOF
fi

if [[ "$config_data" != "" ]]; then
  exec ngrok -config /config/ngrok.yml "$@"
fi

exec ngrok "$@"
