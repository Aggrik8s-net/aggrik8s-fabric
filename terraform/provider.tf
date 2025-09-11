terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://nyc3.digitaloceanspaces.com"
    }
#    endpoint = "https://nyc3.digitaloceanspaces.com"

    bucket = "aggrik8s-fabric"
    key    = "terraform.tfstate"

    # Deactivate a few AWS-specific checks
    skip_credentials_validation = true
    # skip_requesting_account_id  = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    # skip_s3_checksum            = true
    skip_s3_checksum            = true
    region                      = "nyc3"
  }

  required_providers {
    routeros  = {
      source  = "terraform-routeros/routeros"
      // version = "7.20rc1"
    }
    doppler = {
      source = "DopplerHQ/doppler"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.66.0"
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
  password       = data.doppler_secrets.aggrik8s-fabric.map.FABRIC_PASSWORD  # RouterOS Password
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                            # env ROS_INSECURE or MIKROTIK_INSECURE
}

provider "routeros" {
  alias = "rb5009-02"
  // host  = "192.168.10.3"
  hosturl        = "https://192.168.88.3"        # env ROS_HOSTURL or MIKROTIK_HOST
  username       = "admin"                       # env ROS_USERNAME or MIKROTIK_USER
  password       = data.doppler_secrets.aggrik8s-fabric.map.FABRIC_PASSWORD  # RouterOS Password
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                          # env ROS_INSECURE or MIKROTIK_INSECURE
}


provider "routeros" {
  alias          = "crs305-01"
// host  = "192.168.10.4"
  hosturl        = "https://192.168.88.4"        # env ROS_HOSTURL or MIKROTIK_HOST
  username       = "admin"                       # env ROS_USERNAME or MIKROTIK_USER
  password       = data.doppler_secrets.aggrik8s-fabric.map.FABRIC_PASSWORD  # RouterOS Password
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                          # env ROS_INSECURE or MIKROTIK_INSECURE
}


provider "routeros" {
  alias = "crs328-01"
  // host  = "192.168.10.5"
  hosturl        = "https://192.168.88.5"        # env ROS_HOSTURL or MIKROTIK_HOST
  username       = "admin"                       # env ROS_USERNAME or MIKROTIK_USER
  password       = data.doppler_secrets.aggrik8s-fabric.map.FABRIC_PASSWORD  # RouterOS Password
  // sensitive      = true
  #ca_certificate = "~/capath" # env ROS_CA_CERTIFICATE or MIKROTIK_CA_CERTIFICATE
  insecure       = true                          # env ROS_INSECURE or MIKROTIK_INSECURE
}

provider "digitalocean" {
  token             = data.doppler_secrets.aggrik8s-fabric.map.DO_TOKEN
  spaces_access_id  = data.doppler_secrets.aggrik8s-fabric.map.DO_SPACES_ACCESS_ID
  spaces_secret_key = data.doppler_secrets.aggrik8s-fabric.map.DO_SPACES_SECRET_KEY
  // spaces_access_id  = data.doppler_secrets.aggrik8s-fabric.map.AWS_ACCESS_KEY_ID
  // spaces_secret_key = data.doppler_secrets.aggrik8s-fabric.map.AWS_SECRET_ACCESS_KEY
}

