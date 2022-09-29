#!/bin/bash
set -e

echo ""
echo "When including a plugin in a BitOps install, this script will be called during docker build."
echo "It should be used to install any dependencies required to actually run your plugin."
echo "BitOps uses alpine linux as its base, so you'll want to use apk commands (Alpine Package Keeper)"
echo ""

apk info

mkdir -p /opt/download
cd /opt/download

LATEST_RELEASE=$(curl https://storage.googleapis.com/kubernetes-release/release/stable.txt)
KUBECTL_VERSION=${LATEST_RELEASE}

function install_kubectl() {
    curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
    chmod +x ./kubectl && mv kubectl /usr/local/bin/
}

install_kubectl

