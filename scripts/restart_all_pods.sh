#!/bin/bash
NAMESPACE=bitcoin
STS_NAME=bitcoin-node

ALL_PODS=($(kubectl -n ${NAMESPACE} get pod | grep -Eo "^${STS_NAME}-[0-9]+(\s|$)"))

echo "Restarting pods..."

for p in ${ALL_PODS[@]}; do
    kubectl -n bitcoin delete pod $p
done
