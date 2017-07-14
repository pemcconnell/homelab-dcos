#!/bin/sh

packer build \
  -var "AuthorizedKeys=${AUTHORIZED_KEYS}" \
  -var "remote_host=${REMOTE_HOST}" \
  -var "remote_username=${REMOTE_USER}" \
  -var "remote_password=${REMOTE_PASSWORD}" \
  -var "remote_datastore=${REMOTE_DATASTORE}" \
  packer.json
