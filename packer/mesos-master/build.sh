#!/bin/bash - 
#===============================================================================
#
#          FILE: build.sh
# 
#         USAGE: ./build.sh 
# 
#   DESCRIPTION: builds packer image
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Peter McConnell (me@petermccnnell.com), 
#  ORGANIZATION: ---
#       CREATED: 12/07/2017 16:56
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset                              # Treat unset variables as an error

packer build \
  -var "AuthorizedKeys=${AUTHORIZED_KEYS}" \
  -var "remote_host=${REMOTE_HOST}" \
  -var "remote_username=${REMOTE_USER}" \
  -var "remote_password=${REMOTE_PASSWORD}" \
  -var "remote_datastore=${REMOTE_DATASTORE}" \
  packer.json
