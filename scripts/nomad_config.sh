# Create nomad config dir
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d

# Create nomad data dir
sudo mkdir -p /opt/nomad

# Copy nomad server config
sudo cp /vagrant/config/server.hcl /etc/nomad.d

# Copy nomad client config
sudo cp /vagrant/config/client.hcl /etc/nomad.d

# adjust interface if not named enp0s8
[ -d /etc/nomad.d/ ] && {
  IFACE=`route -n | awk '$1 ~ "192.168.*.*" {print $8}'`
  if [ "${IFACE}" != enp0s8 ]; then
    sudo sed -i "s/enp0s8/${IFACE}/g" /etc/nomad.d/*.hcl
  fi
}


