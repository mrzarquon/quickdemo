#!/bin/bash

PUPPET_MASTER="Insert Puppet Master's name here"
PUPPET_ROLE="webserver"


mkdir -p /etc/puppetlabs/facter/facts.d

echo "role=${PUPPET_ROLE}" > /etc/puppetlabs/facter/facts.d/role.txt

curl -sk https://${PUPPET_MASTER}:8140/packages/current/install.bash | /bin/bash
