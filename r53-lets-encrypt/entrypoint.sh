#!/bin/sh

trap 'exit 0' INT TERM

if [ -z "${LE_EMAIL}" ]; then
  echo "We need an email for let's encrypt. Set env var LE_EMAIL"
  exit 1
fi

if [ -z "${DOMAINS}" ]; then
  echo "We need domains. Set env var DOMAINS"
  exit 1
fi

[ -f /ssl/dhparam.pem ] || openssl dhparam -out ./ssl/dhparam.pem 4096

echo "${DOMAINS}" > domains.txt

while true; do
  ./letsencrypt.sh --config ./config.sh --cron
  sleep 3600
done
