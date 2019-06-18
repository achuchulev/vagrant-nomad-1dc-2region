#!/usr/bin/env bash

# Copy nomad service config
sudo cp /vagrant/config/nomad-server.service /etc/systemd/system
sudo cp /vagrant/config/nomad-client.service /etc/systemd/system

# Enable & start nomad service
sudo systemctl enable nomad-server.service
sudo systemctl start nomad-server.service

sudo systemctl enable nomad-client.service
sudo systemctl start nomad-client.service

# Enable Nomad's CLI command autocomplete support
sudo nomad -autocomplete-install