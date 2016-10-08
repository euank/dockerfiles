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

if [ -z "${NO_GEN_DHPARAM}" ]; then
  [ -f /certs/dhparam.pem ] || openssl dhparam -out /certs/dhparam.pem 2048
fi

echo "${DOMAINS}" > domains.txt

while true; do
  ./dehydrated --config ./config.sh --cron
  sleep 3600
done
