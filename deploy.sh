#!/usr/bin/env bash
set -ex

echo "Running kubectl plugin"
bash $PLUGIN_DIR/kubectl/scripts/kubeconfig_base64_decode.sh