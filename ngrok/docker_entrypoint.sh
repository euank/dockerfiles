#!/usr/bin/env bash
set -eu

config_data=""
# Only supported env var for now
if [[ "${NGROK_AUTH_TOKEN-}" != "" ]]; then
  config_data=$(cat <<EOF
$config_data
authtoken: "${NGROK_AUTH_TOKEN}"
EOF
)
fi

if [[ "$config_data" != "" ]]; then
  mkdir -p "$HOME/.ngrok2"
  echo "$config_data" > $HOME/.ngrok2/ngrok.yml
fi

exec ngrok "$@"
