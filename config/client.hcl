# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir  = "/opt/nomad"

# Give the agent a unique name. Defaults to hostname
name = "client-dc1"

region = "global"

datacenter = "dc1"

bind_addr = "0.0.0.0"

advertise {
  rpc = "{{ GetInterfaceIP \"enp0s8\" }}"
  http = "{{ GetInterfaceIP \"enp0s8\" }}"
  serf = "{{ GetInterfaceIP \"enp0s8\" }}"
}

# Enable the client
client {
  enabled = true
  servers = ["192.168.10.10:4647"]
  
  options = {
    "driver.raw_exec" = "1"
    "driver.raw_exec.enable" = "1"
  }
}

# Modify our port to avoid a collision with server
ports {
    http = 5656
}

