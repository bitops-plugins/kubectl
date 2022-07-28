# Bitops Plugin for Kubectl

## Table of contents

1. [Introduction](#Introduction)
2. [Installation](https://github.com/bitops-plugins/kubectl/blob/main/INSTALL.md)
3. [Deployment](#Deployment)

---

## Introduction
This plugin will install ``kubectl`` cli.



## Deployment

``kubectl`` plugin is used internally by other plugins like ``helm`` or ``terraform`` and ``ansible`` etc..

### Sample HELM Config
```
helm:
  cli:
    namespace: ingress-nginx
    timeout: 200s
    debug: true
    atomic: true
    force: false
    dry-run: true
  options:
    release-name: ingress-nginx
    skip-deploy: false
    default-root-dir: _default
    default-dir-flag: false
    default-sub-dir: helm/nginx-ingress
    aws:
      fetch:
        kubeconfig: true
        cluster-name: recruiting-recruiting-recruiting-ekscluster
```

In the above sample helm config yaml, ``aws.fetch.kubeconfig: true`` config will let ``helm`` plugin use ``kubectl`` plugin to fetch ``kubeconfig`` dynamically.

## Deployment


### CLI Configuration

``BITOPS_KUBECONFIG_BASE64`` is an optional config that can be passed to docker run when we want to use a kube config with static token.

#### Note: Its highly recommended not to use static tokens that never expires.  

#### Sample Docker Run

```
docker run --rm --name bitops \
-e AWS_ACCESS_KEY_ID="${BITOPS_AWS_ACCESS_KEY_ID}" \
-e AWS_SECRET_ACCESS_KEY="${BITOPS_AWS_SECRET_ACCESS_KEY}" \
-e AWS_DEFAULT_REGION="${BITOPS_AWS_DEFAULT_REGION}" \
-e BITOPS_ENVIRONMENT="${ENVIRONMENT}" \
-e BITOPS_KUBECONFIG_BASE64="${BITOPS_KUBECONFIG_BASE64}" \
-v $(pwd):/opt/bitops_deployment \
bitops-core:latest

```