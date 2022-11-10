#!/bin/bash
set -ex

if [ "$KUBECTL_SKIP_DEPLOY" == "true" ]; then
  echo "KUBECTL_SKIP_DEPLOY is set.  Skipping."
  exit 0
fi

export $PLUGIN_DIR="$BITOPS_PLUGIN_DIR"

echo "Running kubectl plugin"
bash $PLUGIN_DIR/scripts/kubeconfig_base64_decode.sh
