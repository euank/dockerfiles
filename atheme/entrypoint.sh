#!/bin/bash

cp -R /atheme/base-etc/ /atheme/etc/

# TODO write this in a better config language

if [[ ! -f /atheme/etc/atheme.protocol.conf ]]; then
  SERVER_PROTOCOL=${SERVER_PROTOCOL:?Must specify SERVER_PROTOCOL (e.g. inspircd)}

  cat > /atheme/etc/atheme.protocol.conf <<EOF
  loadmodule "modules/protocol/${SERVER_PROTOCOL}";
EOF

fi
if [[ ! -f /atheme/etc/atheme.info.conf ]]; then
  SERVER_NAME=${SERVER_NAME:?Must specify SERVER_NAME (e.g. irc.foo.bar)}
  SERVER_DESC=${SERVER_DESC:?Must specify SERVER_DESC (e.g. Foo IRC Services)}
  SERVER_NETNAME=${SERVER_NETNAME:?Must specify SERVER_NETNAME (e.g. Foo IRC)}
  SERVER_ADMIN=${SERVER_ADMIN:?Must specify SERVER_ADMIN (your nick)}
  SERVER_NUMERIC=${SERVER_NUMERIC:-""}
  SERVER_ADMINEMAIL=${SERVER_ADMINEMAIL:?Must specify SERVER_ADMINEMAIL (your email)}

  cat > /atheme/etc/atheme.info.conf <<EOF
serverinfo {
  name = "${SERVER_NAME}";
  desc = "${SERVER_DESC}";
  numeric = "${SERVER_NUMERIC}";
  recontime = 10;
  netname = "${SERVER_NETNAME}";
  hidehostsuffix = "users.misconfigured";
  adminname = "${SERVER_ADMIN}";
  adminemail = "${SERVER_ADMINEMAIL}";
  #mta = "/usr/sbin/sendmail";
  loglevel = { error; info; admin; network; wallops; };
  maxlogins = 5;
  maxusers = 0;
  maxnicks = 10;
  maxchans = 20;
  mdlimit = 30;
  emaillimit = 10;
  emailtime = 300;
  auth = none;
  casemapping = rfc1459;
};
EOF
fi
# TODO, support multiple uplinks
if [[ ! -f /atheme/etc/atheme.uplink.conf ]]; then
  UPLINK_NAME=${UPLINK_NAME:?Must specify uplink name (e.g. svc.foo.bar.com)}
  UPLINK_HOST=${UPLINK_HOST:?Must specify uplink host (e.g. svc.foo.bar.com)}
  UPLINK_PASSWORD=${UPLINK_PASSWORD:?Must specify uplink password}
  UPLINK_PORT=${UPLINK_PORT:?Must specify uplink port (e.g. 8000)}

  cat > /atheme/etc/atheme.uplink.conf <<EOF
uplink "${UPLINK_NAME}" {
  host = "${UPLINK_HOST}";
  password = "${UPLINK_PASSWORD}";
  port = ${UPLINK_PORT};
};
EOF
fi

if [[ ! -f /atheme/etc/atheme.oper.conf ]]; then
  OPER_NICK=${OPER_NICK:?Must specify oper nick}

  cat > /atheme/etc/atheme.oper.conf <<EOF
operator "ek" {
  operclass = "sra";
};
EOF

fi

if [[ -n "${LOGFILE_CHANNEL}" ]]; then
  cat >> /atheme/etc/atheme.conf <<EOF

  logfile "#${LOGFILE_CHANNEL}" { error; info; admin; request; register; };
EOF
fi

exec /atheme/bin/atheme-services -n
