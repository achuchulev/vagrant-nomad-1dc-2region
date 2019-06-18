#!/usr/bin/env bash

# Copy nomad service config
cp /vagrant/config/nomad-server.service /etc/systemd/system
cp /vagrant/config/nomad-client.service /etc/systemd/system

# Enable & start nomad service
systemctl enable nomad-server.service
systemctl start nomad-server.service

systemctl enable nomad-client.service
systemctl start nomad-client.service

# Enable Nomad's CLI command autocomplete support
nomad -autocomplete-install
