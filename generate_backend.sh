#!/bin/bash

cat <<EOF > "./${LOCAL_FOLDER}/backend.tfvars"
region = "${REGION}"
bucket = "${REMOTE_STATE_BUCKET}"
key    = "${KEY_TF_STATE}"
EOF
