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
elif [ "$1" != "docker" ] && [ "$1" != "vmware-iso" ]; then
  echo 1>&2 "$0: The first argument must be docker or vmware-iso."
  echo 1>&2 "$0: e.g. ./build.sh docker"
  exit 2
fi

packer build \
  -only=$1 \
  -var "author=${author}" \
  -var "remote_host=${vsphere_vcenter}" \
  -var "remote_username=${vsphere_user}" \
  -var "remote_password=${vsphere_password}" \
  -var "remote_datastore=${vsphere_datastore}" \
  -var "authorized_keys=${vsphere_authorizedkeys}" \
  -var "iso_url=https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.0.0-amd64-xfce-CD-1.iso" \
  -var "iso_md5_checksum=9346436c0cf1862af71cb0a03d9a703c" \
  -var "docker_image=debian:9.0" \
  packer.json
