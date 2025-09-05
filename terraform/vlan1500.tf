//
//
//
# Define an address list for BGP peers.
# This makes the firewall rule more maintainable.
resource "routeros_ip_firewall_addr_list" "bgp_peers_vlan1500" {
  provider = routeros.rb5009-01
  // name     = "vlan1500_bgp_peer"
  address  = "192.168.88.3" # Replace with the actual IP address of your BGP peer.
  list     = "vlan1500_addrs"
  comment  = "Address list for BGP peers"
}

# Create a firewall filter rule to accept incoming BGP connections.
resource "routeros_ip_firewall_filter" "allow_bgp_in_vlan1500" {
  provider         = routeros.rb5009-01
  action           = "accept"
  chain            = "input"
  comment          = "Allow incoming BGP connections"
  protocol         = "tcp"
  dst_port         = "179"
  src_address_list = routeros_ip_firewall_addr_list.bgp_peers_vlan1500.list
}

resource "routeros_ip_dhcp_server_network" "vlan1500" {
  provider   = routeros.rb5009-01
  address    = "192.168.15.0/24"
  // gateway    = "192.168.15.2"
  dns_server = ["8.8.8.8", "8.8.4.4"]

/*
  lifecycle {
    ignore_changes = [
      id,
      dns_server
    ]
  }
*/

}
//
//
//
resource "routeros_interface_bridge_port" "vlan1500_port_on_rb5009-01" {
  provider          = routeros.rb5009-01
  bridge            = routeros_interface_bridge.rb5009-01.name
  pvid              = routeros_interface_vlan.rb5009-01_vlan-1500.vlan_id
  interface         = routeros_interface_vlan.rb5009-01_vlan-1500.name
  frame_types       = "admit-only-vlan-tagged"
  ingress_filtering = true
  hw                = true
  comment           = "Talos East (TF)"
}

// resource "routeros_interface_bridge_port" "vlan1500_port_on_rb5009-02" {
//   provider          = routeros.rb5009-02
//   bridge            = routeros_interface_bridge.rb5009-02.name
//   pvid              = routeros_interface_vlan.rb5009-02_vlan-1500.vlan_id
//   interface         = routeros_interface_vlan.rb5009-02_vlan-1500.name
//   frame_types       = "admit-only-vlan-tagged"
//   ingress_filtering = true
//   hw                = true
//   comment           = "Talos East (TF)"
// }

resource "routeros_interface_bridge_port" "vlan1500_port_on_crs305-01" {
  provider          = routeros.crs305-01
  bridge            = routeros_interface_bridge.crs305-01.name
  pvid              = routeros_interface_vlan.crs305-01_vlan-1500.vlan_id
  interface         = routeros_interface_vlan.crs305-01_vlan-1500.name
  frame_types       = "admit-only-vlan-tagged"
  ingress_filtering = true
  hw                = true
  comment           = "Talos East (TF)"
}

resource "routeros_interface_bridge_port" "vlan1500_port_on_crs328-01" {
  provider          = routeros.crs328-01
  bridge            = routeros_interface_bridge.crs328-01.name
  pvid              = routeros_interface_vlan.crs328-01_vlan-1500.vlan_id
  interface         = routeros_interface_vlan.crs328-01_vlan-1500.name
  frame_types       = "admit-only-vlan-tagged"
  ingress_filtering = true
  hw                = true
  comment           = "Talos East (TF)"
}

resource "routeros_ip_pool" "vlan1500_core" {
  provider = routeros.rb5009-01
  name   = "vlan1500"
  ranges = ["192.168.15.20-192.168.15.127"]
}

resource "routeros_ip_dhcp_server" "vlan1500" {
  provider     = routeros.rb5009-01
  address_pool = routeros_ip_pool.vlan1500_core.id
  interface    = routeros_interface_vlan.rb5009-01_vlan-1500.name
  # interface    = "ether2"
  name         = "dhcp_vlan1500"
  comment      = "DHCP server for vlan1500."
/*
  lifecycle {
    ignore_changes = [
      address_pool,
    ]
  }
*/
}

resource "routeros_interface_bridge_vlan" "vlan1500_rb5009-01" {
  provider   = routeros.rb5009-01
  bridge     = routeros_interface_bridge.rb5009-01.name
  vlan_ids   = [routeros_interface_vlan.rb5009-01_vlan-1500.vlan_id]
  tagged     = ["bridge", "ether2", "ether4", "sfp-sfpplus1"]
  untagged   = ["ether5", "ether6", "ether7", "ether8"]        # Example port
}

// resource "routeros_interface_bridge_vlan" "vlan1500_rb5009-02" {
//   provider   = routeros.rb5009-02
//   bridge     = routeros_interface_bridge.rb5009-02.name
//   vlan_ids   = [routeros_interface_vlan.rb5009-02_vlan-1500.vlan_id]
//   tagged     = ["bridge", "ether2", "ether4", "sfp-sfpplus1"]
//   untagged   = []        # Example port
// }

resource "routeros_interface_bridge_vlan" "vlan1500_crs305-01" {
  provider   = routeros.crs305-01
  bridge     = routeros_interface_bridge.crs305-01.name
  vlan_ids   = [routeros_interface_vlan.crs305-01_vlan-1500.vlan_id]
  tagged     = [routeros_interface_vlan.crs305-01_vlan-1500.interface, "sfp-sfpplus1", "sfp-sfpplus2", "sfp-sfpplus3"]
  untagged   = []        # Example port
}

resource "routeros_interface_bridge_vlan" "vlan1500_crs328-01" {
  provider   = routeros.crs328-01
  bridge     = routeros_interface_bridge.crs328-01.name
  vlan_ids   = [routeros_interface_vlan.crs328-01_vlan-1500.vlan_id]
  tagged     = [routeros_interface_vlan.crs328-01_vlan-1500.interface,  "ether8", "ether18", "ether22", "sfp-sfpplus1", "sfp-sfpplus3", "sfp-sfpplus4"]
  untagged   = ["ether7", "ether17"]        # Example port
}

resource "routeros_interface_vlan" "crs305-01_vlan-1500" {
  provider = routeros.crs305-01
  name      = "VLAN1500"
  vlan_id   = 1500
  interface = routeros_interface_bridge.crs305-01.name
  comment = "Talos East (TF)"
}

resource "routeros_interface_vlan" "rb5009-01_vlan-1500" {
  provider = routeros.rb5009-01
  name      = "VLAN1500"
  vlan_id   = 1500
  interface = routeros_interface_bridge.rb5009-01.name
  comment = "Talos East (TF)"
}

// resource "routeros_interface_vlan" "rb5009-02_vlan-1500" {
//   provider = routeros.rb5009-02
//   name      = "VLAN1500"
//   vlan_id   = 1500
//   interface = routeros_interface_bridge.rb5009-02.name
//   comment = "Talos East (TF)"
// }

resource "routeros_interface_vlan" "crs328-01_vlan-1500" {
  provider  = routeros.crs328-01
  name      = "VLAN1500"
  vlan_id   = 1500
  # interface = routeros_interface_vlan.crs328-01_vlan-1500.name
  interface = routeros_interface_bridge.crs328-01.name
  comment = "Talos East (TF)"
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "rb5009-01_vlan-1500_address" {
  provider = routeros.rb5009-01
  address   = "192.168.15.2/24"
  interface = routeros_interface_vlan.rb5009-01_vlan-1500.name
  comment   = "VLAN1500"
}

// # Assign an IP address to the VLAN interface
// resource "routeros_ip_address" "rb5009-02_vlan-1500_address" {
//   provider = routeros.rb5009-02
//   address   = "192.168.15.3/24"
//   interface = routeros_interface_vlan.rb5009-02_vlan-1500.name
//   comment   = "VLAN1500"
// }

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "crs305-01_vlan-1500_address" {
  provider = routeros.crs305-01
  address   = "192.168.15.4/24"
  interface = routeros_interface_vlan.crs305-01_vlan-1500.name
  comment   = "VLAN1500"
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "crs328-01_vlan-1500_address" {
  provider  = routeros.crs328-01
  address   = "192.168.15.5/24"
  interface = routeros_interface_vlan.crs328-01_vlan-1500.name
}

//
// VL1500 DHCP is run on rb5009-01
//
resource "routeros_ip_dhcp_server_lease" "vlan1500_pi-manage-01" {
  provider    = routeros.rb5009-01
  mac_address = "2c:cf:67:0f:1f:44"
  address     = "192.168.15.21"
  server      = routeros_ip_dhcp_server.vlan1500.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "vlan1500_macbook-pro" {
  provider    = routeros.rb5009-01
  mac_address = "4C:EA:41:67:63:DB"
  address     = "192.168.15.50"
  server      = routeros_ip_dhcp_server.vlan1500.name
  comment     = "Terraformed static lease."
}