#!/bin/bash
set -ex

export $PLUGIN_DIR="$BITOPS_PLUGIN_DIR"

echo "Running kubectl plugin"
bash $PLUGIN_DIR/scripts/kubeconfig_base64_decode.sh