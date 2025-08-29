terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
    }
    doppler = {
      source = "DopplerHQ/doppler"
    }
  }
}
# Configure the Doppler provider with the token
provider "doppler" {
  // Injected using `doppler run`
  doppler_token = var.doppler_token_fabric_dev
}
/*
# providers.tf
terraform {
  required_providers {
    routeros = {
      source = "GNewbury1/routeros"
    }
  }
}
*/

/*
provider "routeros" {
  for_each = var.routeros_devices
  alias    = each.key
  host     = each.value.host
  username = each.value.username
  password = each.value.password
  insecure = true # Only for testing! Use TLS in production.
}
*/

provider "routeros" {
  alias = "rb5009-01"
  // host  = "192.168.10.2"
  hosturl        = "https://192.168.88.2"          # env ROS_HOSTURL or MIKROTIK_HOST
  username       = "admin"                         # env ROS_USERNAME or MIKROTIK_USER
  password       = data.doppler_secrets.this.map.FABRIC_PASSWORD  # RouterOS Password
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                            # env ROS_INSECURE or MIKROTIK_INSECURE
}

provider "routeros" {
  alias = "rb5009-02"
  // host  = "192.168.10.3"
  hosturl        = "https://192.168.88.3"        # env ROS_HOSTURL or MIKROTIK_HOST
  username       = "admin"                       # env ROS_USERNAME or MIKROTIK_USER
  password       = data.doppler_secrets.this.map.FABRIC_PASSWORD  # RouterOS Password
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                          # env ROS_INSECURE or MIKROTIK_INSECURE
}


provider "routeros" {
  alias = "crs305-01"
  // host  = "192.168.10.4"
  hosturl        = "https://192.168.88.4"        # env ROS_HOSTURL or MIKROTIK_HOST
  username       = "admin"                       # env ROS_USERNAME or MIKROTIK_USER
  password       = data.doppler_secrets.this.map.FABRIC_PASSWORD  # RouterOS Password
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                          # env ROS_INSECURE or MIKROTIK_INSECURE
}


provider "routeros" {
  alias = "crs328-01"
  // host  = "192.168.10.5"
  hosturl        = "https://192.168.88.5"        # env ROS_HOSTURL or MIKROTIK_HOST
  username       = "admin"                       # env ROS_USERNAME or MIKROTIK_USER
  password       = data.doppler_secrets.this.map.FABRIC_PASSWORD  # RouterOS Password
  // sensitive      = true
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                          # env ROS_INSECURE or MIKROTIK_INSECURE
}