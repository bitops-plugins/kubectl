#!/bin/bash
set -e

# ensure dir exists
KUBE_CONFIG_DIR="$(dirname "$BITOPS_KUBE_CONFIG_FILE")"
if [ ! -d "$KUBE_CONFIG_DIR" ]; then
  mkdir -p "$KUBE_CONFIG_DIR"
fi

echo "${KUBECONFIG_BASE64}" | base64 -d > "$BITOPS_KUBE_CONFIG_FILE"


echo "kubeconfig created from KUBECONFIG_BASE64: $BITOPS_KUBE_CONFIG_FILE"