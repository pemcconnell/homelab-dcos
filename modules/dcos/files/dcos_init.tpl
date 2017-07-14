#!/bin/bash - 
#===============================================================================
#
#          FILE: dcos-init.sh
# 
#         USAGE: ./dcos-init.sh 
# 
#   DESCRIPTION: This file looks to automate the steps detailed in 
#                https://dcos.io/docs/1.9/installing/custom/advanced/
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Peter McConnell (me@petermcconnell.com), 
#  ORGANIZATION: 
#       CREATED: 14/07/2017 20:56
#      REVISION:  ---
#===============================================================================

set -e
set -o nounset                              # Treat unset variables as an error


cd /etc/genconf

# download installer
curl -O https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh

# generate config
bash dcos_generate_config.sh

# run webserver for install process
docker run -d -p 80:80 -v $PWD/genconf/serve:/usr/share/nginx/html:ro nginx
