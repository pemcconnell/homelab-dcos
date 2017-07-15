#!/bin/bash - 
#===============================================================================
#
#          FILE: build.sh
# 
#         USAGE: ./build.sh vmware-iso
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Peter McConnell (me@petermcconnell.com)
#  ORGANIZATION: 
#       CREATED: 14/07/2017 21:03
#      REVISION:  ---
#===============================================================================


set -o nounset -o errexit -o pipefail

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ "$1" = "docker" ]; then
  echo 1>&2 "$0: Docker is not currently supported for this build."
  exit 2
elif [ "$1" != "vmware-iso" ]; then
  echo 1>&2 "$0: The first argument must be vmware-iso."
  echo 1>&2 "$0: e.g. ./build.sh vmware-iso"
  exit 2
fi

packer build \
  -var "author=${author}" \
  -var "remote_host=${vsphere_vcenter}" \
  -var "remote_username=${vsphere_user}" \
  -var "remote_password=${vsphere_password}" \
  -var "remote_datastore=${vsphere_datastore}" \
  -var "authorized_keys=${vsphere_authorizedkeys}" \
  -var "iso_url=https://stable.release.core-os.net/amd64-usr/current/coreos_production_iso_image.iso" \
  -var "iso_md5_checksum=0da9440525e04baa73b36fba46909b13" \
  packer.json
