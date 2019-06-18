# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir  = "/opt/nomad"

region = "global"

datacenter = "dc1"

bind_addr = "0.0.0.0"

advertise {
  rpc = "{{ GetInterfaceIP \"enp0s8\" }}"
  http = "{{ GetInterfaceIP \"enp0s8\" }}"
  serf = "{{ GetInterfaceIP \"enp0s8\" }}"
}

# Enable the server
server {
  enabled = true

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 1

  server_join {
    retry_join = [ "192.168.10.10" ]
    retry_max = 3
    retry_interval = "15s"
  }
}



