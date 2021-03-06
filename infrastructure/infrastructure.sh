#!/usr/bin/env bash

set -ex

if [ -z "${1}"  ]; then
    echo "Usage: ./infrastructure <create|destroy>"

    exit 1
fi


if [ "${1}" == "create" ]; then

    terraform init
    terraform plan

    terraform apply -auto-approve


fi

if [ "${1}" == "destroy" ]; then

    terraform destroy --force

fi
