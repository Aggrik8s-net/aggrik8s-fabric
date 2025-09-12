// rb5009-01
resource "routeros_system_identity" "rb5009-01_identity" {
  provider = routeros.rb5009-01
  name = "rb5009-01"
}
resource "routeros_system_clock" "rb5009-01_timezone" {
  provider = routeros.rb5009-01
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}

// rb5009-02
resource "routeros_system_identity" "rb5009-02_identity" {
  provider = routeros.rb5009-02
  name = "rb5009-02"
}
resource "routeros_system_clock" "rb5009-02_timezone" {
  provider = routeros.rb5009-02
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}
// resource "routeros_identity" "router_id_rb5009-02" {
//   provider = routeros.rb5009-02
//   name = "id-1" # Set your desired Router ID here
// #  id       = routeros_ip_address.ospf_loopback_ip_rb5009-02.network
// }

// crs305-02
resource "routeros_system_identity" "crs305-01_identity" {
  provider = routeros.crs305-01
  name = "crs305-01"
}
resource "routeros_system_clock" "crs305-01_timezone" {
  provider = routeros.crs305-01
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}

// crs305-02
resource "routeros_system_identity" "crs328-01_identity" {
  provider = routeros.crs328-01
  name = "crs328-01"
}
resource "routeros_system_clock" "crs328-01_timezone" {
  provider = routeros.crs328-01
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}

//
//  VLAN #1 (Native) DHCP resources
//
import {
  to = routeros_ip_dhcp_server_network.vlan1
  id = "*1"
}
import {
  to = routeros_ip_pool.vlan1
  id = "*1"
}
import {
  to = routeros_ip_dhcp_server.vlan1
  id = "*1"
}
// import {
//  to = routeros_interface_bridge.crs305-01.name
//  id = ""
// }
//
//
resource "routeros_ip_dhcp_server_network" "vlan1" {
  provider = routeros.crs305-01
  address    = "192.168.88.0/24"
  gateway    = "192.168.88.2"
  dns_server = ["8.8.8.8, 8.8.4.4"]
}

resource "routeros_ip_pool" "vlan1" {
  provider = routeros.crs305-01
  # name   = "vlan1"
  name = "vlan1_pool0"
  ranges = ["192.168.88.20-192.168.88.127"]
}

resource "routeros_ip_dhcp_server" "vlan1" {
  provider     = routeros.crs305-01
  address_pool = routeros_ip_pool.vlan1.id
  # interface    = routeros_interface_vlan.crs305-01_vlan-1.name
  # interface    = routeros_interface_vlan.crs305-01.
  interface    = routeros_interface_bridge.crs305-01.name
  name         = "vlan1"
  comment      = "Terraformed DHCP server for vlan1."

  //  lifecycle {
  //    ignore_changes = [
  //      address_pool,
  //      comment,
  //    ]
}
/*
resource "routeros_interface_vlan" "crs305-01_vlan-1" {
  provider = routeros.crs305-01
  name      = "VLAN1"
  vlan_id   = 1
  interface = routeros_interface_bridge.crs305-01.name
  comment = "Native VLAN (TF)"
}
 */

//
// VL2000 DHCP is run on rb5009-02
//
resource "routeros_ip_dhcp_server_lease" "vlan1_pi-manage-01" {
  provider    = routeros.crs305-01
  mac_address = "2c:cf:67:0f:1f:44"
  address     = "192.168.88.21"
  server      = routeros_ip_dhcp_server.vlan1.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "vlan1_macbook-pro" {
  provider    = routeros.crs305-01
  mac_address = "4C:EA:41:67:63:DB"
  address     = "192.168.88.50"
  server      = routeros_ip_dhcp_server.vlan1.name
  comment     = "Terraformed static lease."
}

//
//
//
resource "routeros_system_certificate" "letsencrypt_rb5009-01" {
  provider    = routeros.rb5009-01
  // acme_ssl_certificate {}
  common_name = "aggrik8s.net"
  name        = "aggrik8s.net"
}

resource "routeros_system_certificate" "letsencrypt_rb5009-02" {
  provider    = routeros.rb5009-02
  // acme_ssl_certificate {}
  common_name = "aggrik8s.net"
  name        = "aggrik8s.net"
}
