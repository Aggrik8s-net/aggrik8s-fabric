# variables.tf
variable "routeros_devices" {
  type = map(object({
    host     = string
    username = string
    password = string
  }))
  description = "A map of RouterOS devices to manage."
  default = {
    rb5009-01 = {
      host     = "192.168.88.2"
      username = "admin"
      password = "your_password"
    }
    rb5009-02 = {
      host     = "192.168.88.3"
      username = "admin"
      password = "your_password"
    }
    crs305-01 = {
      host     = "192.168.88.4"
      username = "admin"
      password = "your_password"
    }
    crs328-01 = {
      host     = "192.168.88.5"
      username = "admin"
      password = "your_password"
    }
  }
}

# Define a variable so we can pass in our token
variable "doppler_token_fabric_dev" {
  type = string
  description = "A token to authenticate with Doppler for the dev config"
  sensitive = true
}