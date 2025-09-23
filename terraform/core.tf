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

//
//  We need to set up the HW bridge ports using code.
//
//  For now, we will remove the ports from the GUI.
//
//////////////////
variable "bond_interfaces_rb5009-01_crs328-01" {
  type = map(object({
    factory_name = string
    comment      = string
  }))
  default = {
    "bond_1-1" = {
      factory_name = "ether5"
      comment = "LACP link 1"
    }
    "bond_1-2" = {
      factory_name = "ether6"
      comment = "LACP link 2"
    }
    "bond_1-3" = {
      factory_name = "ether7"
      comment = "LACP link 3"
    }
    "bond_1-4" = {
      factory_name = "ether8"
      comment = "LACP link 4"
    }
  }
}
resource "routeros_interface_ethernet" "bond_interfaces_rb5009-01" {
  provider     = routeros.rb5009-01
  for_each     = var.bond_interfaces_rb5009-01_crs328-01
  name         = each.key
  factory_name = "${each.value.factory_name}"
  comment      = "[terraform] ${each.value.comment}"
}
# Ensure slave interfaces are not part of a bridge or other configuration
# For demonstration purposes, we will define them.
# In a real scenario, you would ensure these ports are clean.
/*
resource "routeros_interface_ethernet" "ether5_rb5009-01" {
  provider = routeros.rb5009-01
  name     = "ether5"
}
resource "routeros_interface_ethernet" "ether6_rb5009-01" {
  provider = routeros.rb5009-01
  name     = "ether6"
}
resource "routeros_interface_ethernet" "ether7_rb5009-01" {
  provider = routeros.rb5009-01
  name     = "ether7"
}
resource "routeros_interface_ethernet" "ether8_rb5009-01" {
  provider = routeros.rb5009-01
  name     = "ether8"
}

# Create the LACP bonding interface
resource "routeros_interface_bonding" "lacp_rb5009-01_crs328-01" {
  provider = routeros.rb5009-01
  name = "bond-crs328-01"
  mode = "802.3ad" # This sets the mode to LACP
  slaves = [
    routeros_interface_ethernet.ether5_rb5009-01.name,
    routeros_interface_ethernet.ether6_rb5009-01.name,
    routeros_interface_ethernet.ether7_rb5009-01.name,
    routeros_interface_ethernet.ether8_rb5009-01.name
  ]
  # Optional: Define how traffic is balanced across links
  transmit_hash_policy = "layer-2-and-3"
  # Optional: Set the LACPDU exchange rate
  lacp_rate = "fast"
}
*/
# Add an IP address to the newly created LACP bond interface
//resource "routeros_ip_address" "bond_ip" {
//  address   = "10.0.1.1/24"
//  interface = routeros_interface_bonding.lacp_bond.name
//}
//////////////////

// rb5009-02
//
//  We need to set up the HW bridge ports using code.
//
//  For now, we will remove the ports from the GUI.
//
//////////////////
variable "bond_interfaces_rb5009-02_crs328-01" {
  type = map(object({
    factory_name = string
    comment = string
  }))
  default = {
    "bond_2-1" = {
      factory_name = "ether5",
      comment = "LACP link 1"
    }
    "bond_2-2" = {
      factory_name = "ether6",
      comment = "LACP link 2"
    }
    "bond_2-3" = {
      factory_name = "ether7",
      comment = "LACP link 3"
    }
    "bond_2-4" = {
      factory_name = "ether8",
      comment = "LACP link 4"
    }
  }
}
resource "routeros_interface_ethernet" "bond_interfaces_rb5009-02" {
  provider = routeros.rb5009-02
  for_each = var.bond_interfaces_rb5009-02_crs328-01
  name     = each.key
  factory_name = "${each.value.factory_name}"
  comment  = "[terraform] ${each.value.comment}"
}
# Ensure slave interfaces are not part of a bridge or other configuration
# For demonstration purposes, we will define them.
# In a real scenario, you would ensure these ports are clean.
/*
resource "routeros_interface_ethernet" "ether5_rb5009-02" {
  provider = routeros.rb5009-02
  name     = "ether5"
}
resource "routeros_interface_ethernet" "ether6_rb5009-02" {
  provider = routeros.rb5009-02
  name     = "ether6"
}
resource "routeros_interface_ethernet" "ether7_rb5009-02" {
  provider = routeros.rb5009-02
  name     = "ether7"
}
resource "routeros_interface_ethernet" "ether8_rb5009-02" {
  provider = routeros.rb5009-02
  name     = "ether8"
}
# Create the LACP bonding interface
resource "routeros_interface_bonding" "lacp_rb5009-02_crs328-01" {
  provider = routeros.rb5009-02
  name = "bond-crs328-01"
  mode = "802.3ad" # This sets the mode to LACP
  slaves = [
    routeros_interface_ethernet.ether5_rb5009-02.name,
    routeros_interface_ethernet.ether6_rb5009-02.name,
    routeros_interface_ethernet.ether7_rb5009-02.name,
    routeros_interface_ethernet.ether8_rb5009-02.name
  ]
  # Optional: Define how traffic is balanced across links
  transmit_hash_policy = "layer-2-and-3"
  # Optional: Set the LACPDU exchange rate
  lacp_rate = "fast"
}
*/

# Add an IP address to the newly created LACP bond interface
//resource "routeros_ip_address" "bond_ip" {
//  address   = "10.0.1.1/24"
//  interface = routeros_interface_bonding.lacp_rb5009-01_crs328-01.name
//}
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

// crs305-01
resource "routeros_system_identity" "crs305-01_identity" {
  provider = routeros.crs305-01
  name = "crs305-01"
}
resource "routeros_system_clock" "crs305-01_timezone" {
  provider = routeros.crs305-01
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}

// crs328-01
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


////////////
//
//  Set up CRS328-01 side of the LACP links
//
////////////
variable "bond_interfaces_crs328-01_rb5009-01" {
  type = map(object({
    factory_name = string
    comment = string
  }))
  default = {
    "bond_3-1" = {
      factory_name = "ether17",
      comment = "LACP link 1"
    }
    "bond_3-2" = {
      factory_name = "ether19",
      comment = "LACP link 2"
    }
    "bond_3-3" = {
      factory_name = "ether21",
      comment = "LACP link 3"
    }
    "bond_3-4" = {
      factory_name = "ether23",
      comment = "LACP link 4"
    }
  }
}
resource "routeros_interface_ethernet" "bond_interfaces_crs328-01_rb5009-01" {
  provider = routeros.crs328-01
  for_each = var.bond_interfaces_crs328-01_rb5009-01
  name     = each.key
  factory_name = "${each.value.factory_name}"
  comment  = "[terraform] ${each.value.comment}"
}
///
variable "bond_interfaces_crs328-01_rb5009-02" {
  type = map(object({
    factory_name = string
    comment = string
  }))
  default = {
    "bond_4-1" = {
      factory_name = "ether18",
      comment = "LACP link 1"
    }
    "bond_4-2" = {
      factory_name = "ether20",
      comment = "LACP link 2"
    }
    "bond_4-3" = {
      factory_name = "ether22",
      comment = "LACP link 3"
    }
    "bond_4-4" = {
      factory_name = "ether24",
      comment = "LACP link 4"
    }
  }
}
resource "routeros_interface_ethernet" "bond_interfaces_crs328-01_rb5009-02" {
  provider = routeros.crs328-01
  for_each = var.bond_interfaces_crs328-01_rb5009-02
  name     = each.key
  factory_name = "${each.value.factory_name}"
  comment  = "[terraform] ${each.value.comment}"
}

//////
//
//  SET UP THE BONDS
//
//////
resource "routeros_interface_bonding" "rb5009-01_crs328-01" {
  provider = routeros.rb5009-01
  name  = "crs328-01_bond"
  mode  = "802.3ad" # Or other modes like "balance-rr", "active-backup", etc.
  slaves = ["bond_1-1", "bond_1-2", "bond_1-3", "bond_1-4"] # Replace with your actual interface names
  # Optional parameters
  lacp_rate = "1sec" # For 802.3ad mode
  // miimon    = 100    # For other modes like balance-rr, active-backup
}
resource "routeros_interface_bonding" "rb5009-02_crs328-01" {
  provider = routeros.rb5009-02
  name  = "crs328-01_bond"
  mode  = "802.3ad" # Or other modes like "balance-rr", "active-backup", etc.
  slaves = ["bond_2-1", "bond_2-2", "bond_2-3", "bond_2-4"] # Replace with your actual interface names
  # Optional parameters
  lacp_rate = "1sec" # For 802.3ad mode
  // miimon    = 100    # For other modes like balance-rr, active-backup
}
resource "routeros_interface_bonding" "crs328-01_rb5009-01" {
  provider = routeros.crs328-01
  name  = "rb5009-01_bond"
  mode  = "802.3ad" # Or other modes like "balance-rr", "active-backup", etc.
  slaves = ["bond_3-1", "bond_3-2", "bond_3-3", "bond_3-4"] # Replace with your actual interface names
  # Optional parameters
  lacp_rate = "1sec" # For 802.3ad mode
  // miimon    = 100    # For other modes like balance-rr, active-backup
}
resource "routeros_interface_bonding" "crs328-01_rb5009-02" {
  provider = routeros.crs328-01
  name  = "rb5009-02_bond"
  mode  = "802.3ad" # Or other modes like "balance-rr", "active-backup", etc.
  slaves = ["bond_4-1", "bond_4-2", "bond_4-3", "bond_4-4"] # Replace with your actual interface names
  # Optional parameters
  lacp_rate = "1sec" # For 802.3ad mode
  // miimon    = 100    # For other modes like balance-rr, active-backup
}