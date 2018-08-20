#!/bin/bash

set -eux

# If someone C-c's or SIGTERM's us that's fine
trap 'exit 0' INT TERM

if [ -z "${LE_EMAIL}" ]; then
  echo "We need an email for let's encrypt. Set env var LE_EMAIL"
  exit 1
fi

if [ -z "${DOMAINS}" ]; then
  echo "We need domains. Set env var DOMAINS"
  exit 1
fi

if [ -z "${NO_GEN_DHPARAM:-}" ]; then
  [ -f /certs/dhparam.pem ] || openssl dhparam -out /certs/dhparam.pem 2048
fi

server="https://acme-staging-v02.api.letsencrypt.org/directory"
if [[ "${LE_STAGING:-${STAGING:-false}}" == false ]]; then
  server="https://acme-v02.api.letsencrypt.org/directory"
fi

DOMAINS=( $DOMAINS )
domain_flags=( "${DOMAINS[@]/#/"--domains "}" )

flags="--accept-tos --email=${LE_EMAIL} --server=${server} --dns=route53 --path=/le-secrets/ ${domain_flags[@]}"

sync_certs() {
  crt=/le-secrets/certificates/"${DOMAINS[0]}.crt"
  key=/le-secrets/certificates/"${DOMAINS[0]}.key"
  if [[ -f "$crt" ]] && [[ -f "$key" ]]; then
    if ! cmp -s "$crt" /certs/ssl.pem>/dev/null; then
      cp "$crt" /certs/ssl.pem
      chmod 444 /certs/ssl.pem
    fi
    if ! cmp -s "$key" /certs/ssl.key>/dev/null; then
      cp "$key" /certs/ssl.key
      # I am so sorry; uids are hard with docker :(
      chmod 444 /certs/ssl.key
    fi
  else
    # TODO: is something wrong enoguh to error? Probably?
    echo "No key + cert, maybe something is wrong?"
  fi
}

# lego can fail in multiple ways in renew, and a plurality of those failures
# may be resolved by using 'run' in place of 'renew'.
# Two concrete examples:
# 1. Initial run
# 2. Account key there, but certificates directory not
# Because there are at least those two cases, I don't bother grepping for
# specific error messages or such here.
if ! lego $flags renew --days 30; then
  lego $flags run
fi
sync_certs

while sleep 3600; do
  lego $flags renew --days 30
  sync_certs
done
