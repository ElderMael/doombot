#!/usr/bin/env bash


if [ "$1" == "create" ]; then

    terraform init
    terraform plan

    terraform apply


fi

if [ "$1" == "destroy" ]; then

    terraform destroy --force

fi
