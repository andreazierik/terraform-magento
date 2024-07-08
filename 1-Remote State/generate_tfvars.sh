#!/bin/bash

cat <<EOF > "./terraform.tfvars"
regiao                = "${REGIAO}"
remote-state-bucket   = "${REMOTE_STATE_BUCKET}"
EOF
