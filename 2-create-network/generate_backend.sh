#!/bin/bash

cat <<EOF > ./backend.tf
region = "${REGION}"
bucket = "${REMOTE_STATE_BUCKET}"
key    = "${KEY}"
EOF
