#!/usr/bin/env bash

# Create nomad config dir
mkdir -p /etc/nomad.d
chmod a+w /etc/nomad.d

# Create nomad data dir
mkdir -p /opt/nomad

# Copy nomad server config
cp /vagrant/config/server.hcl /etc/nomad.d

# Copy nomad client config
cp /vagrant/config/client.hcl /etc/nomad.d

# adjust interface if not named enp0s8
[ -d /etc/nomad.d/ ] && {
  IFACE=`route -n | awk '$1 ~ "192.168.*.*" {print $8}'`
  if [ "${IFACE}" != enp0s8 ]; then
    sed -i "s/enp0s8/${IFACE}/g" /etc/nomad.d/*.hcl
  fi
}
