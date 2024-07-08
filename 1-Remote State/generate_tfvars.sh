#!/bin/bash

cat <<EOF > "./terraform.tfvars"
regiao                = "${REGION}"
remote-state-bucket   = "${REMOTE_STATE_BUCKET}"
EOF
