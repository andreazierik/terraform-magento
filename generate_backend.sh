#!/bin/bash

cat <<EOF > ./backend.tfvars
region = "${REGION}"
bucket = "${REMOTE_STATE_BUCKET}"
key    = "${KEY_TF_STATE}"
EOF