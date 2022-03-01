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


function install_kubectl() {
    wget https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/kubectl
    chmod +x ./kubectl && mv kubectl /usr/local/bin/
}

install_kubectl

