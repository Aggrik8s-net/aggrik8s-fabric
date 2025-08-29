
resource "routeros_ip_dhcp_server_network" "vlan10" {
  provider = routeros.crs328-01
  address    = "192.168.10.0/24"
  gateway    = "192.168.10.2"
  dns_server = ["8.8.8.8, 8.8.4.4"]
}

resource "routeros_ip_pool" "vlan10_core" {
  provider = routeros.crs328-01
  name   = "vlan10"
  ranges = ["192.168.10.20-192.168.10.127"]
}

resource "routeros_ip_dhcp_server" "vlan10" {
  provider     = routeros.crs328-01
  address_pool = routeros_ip_pool.vlan10_core.id
  interface    = routeros_interface_vlan.crs328-01_vlan-10.name
  name         = "vlan10"
  comment      = "Terraformed DHCP server for vlan10."

  //  lifecycle {
  //    ignore_changes = [
  //      address_pool,
  //      comment,
  //    ]
}

resource "routeros_interface_bridge_vlan" "vlan10_rb5009-01" {
  provider   = routeros.rb5009-01
  bridge     = routeros_interface_bridge.rb5009-01.name
  vlan_ids   = [routeros_interface_vlan.rb5009-01_vlan-10.vlan_id]
  tagged     = [routeros_interface_vlan.rb5009-01_vlan-10.interface, "ether2", "sfp-sfpplus1"]
  untagged   = ["ether3"]
}

resource "routeros_interface_bridge_vlan" "vlan10_rb5009-02" {
  provider   = routeros.rb5009-02
  bridge     = routeros_interface_bridge.rb5009-02.name
  vlan_ids   = [routeros_interface_vlan.rb5009-02_vlan-10.vlan_id]
  tagged     = [routeros_interface_vlan.rb5009-02_vlan-10.interface, "ether2", "sfp-sfpplus1"]
  untagged   = ["ether3"]
}

resource "routeros_interface_bridge_vlan" "vlan10_crs305-01" {
  provider   = routeros.crs305-01
  bridge     = routeros_interface_bridge.crs305-01.name
  vlan_ids   = [routeros_interface_vlan.crs305-01_vlan-10.vlan_id]
  tagged     = ["sfp-sfpplus1", "sfp-sfpplus2", "sfp-sfpplus3"]
  untagged   = []
  comment    = "vlan10 (TF)"
}

resource "routeros_interface_bridge_vlan" "vlan10_crs328-01" {
  provider   = routeros.crs328-01
  bridge     = routeros_interface_bridge.crs328-01.name
  vlan_ids   = [routeros_interface_vlan.crs328-01_vlan-10.vlan_id]
  tagged     = [routeros_interface_vlan.crs328-01_vlan-10.interface, "ether18",  "sfp-sfpplus2", "sfp-sfpplus3", "sfp-sfpplus4"]
  untagged   = ["ether9", "ether10", "ether11", "ether12", "ether13", "ether14", "ether15", "ether16", "sfp-sfpplus1"]
}

resource "routeros_interface_vlan" "rb5009-01_vlan-10" {
  provider = routeros.rb5009-01
  name      = "VLAN10"
  vlan_id   = 10
  interface = routeros_interface_bridge.rb5009-01.name
  comment = "piNet (TF)"
}

resource "routeros_interface_vlan" "rb5009-02_vlan-10" {
  provider = routeros.rb5009-02
  name      = "VLAN10"
  vlan_id   = 10
  interface = routeros_interface_bridge.rb5009-02.name
  comment = "piNet (TF)"
}

resource "routeros_interface_vlan" "crs305-01_vlan-10" {
  provider = routeros.crs305-01
  name      = "VLAN10"
  vlan_id   = 10
  interface = routeros_interface_bridge.crs305-01.name
  comment = "piNet (TF)"
}

resource "routeros_interface_vlan" "crs328-01_vlan-10" {
  provider = routeros.crs328-01
  name      = "VLAN10"
  vlan_id   = 10
  interface = routeros_interface_bridge.crs328-01.name
  comment = "piNet (TF)"
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "rb5009-01_vlan-10_address" {
  provider = routeros.rb5009-01
  address   = "192.168.10.2/24"
  interface = routeros_interface_vlan.rb5009-01_vlan-10.name
  comment   = "VLAN10 ipv4 assignment"
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "rb5009-02_vlan-10_address" {
  provider = routeros.rb5009-02
  address   = "192.168.10.3/24"
  interface = routeros_interface_vlan.rb5009-02_vlan-10.name
  comment   = "VLAN10 ipv4 assignment"
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "crs305-01_vlan-10_address" {
  provider = routeros.crs305-01
  address   = "192.168.10.4/24"
  interface = routeros_interface_vlan.crs305-01_vlan-10.name
  comment   = "VLAN2000 ipv4 assignment"
}


# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "crs328-01_vlan-10_address" {
  provider = routeros.crs328-01
  address   = "192.168.10.5/24"
  interface = routeros_interface_vlan.crs328-01_vlan-10.name
}

//
//
//
resource "routeros_interface_bridge_port" "vlan10_port_on_rb5009-01" {
  provider          = routeros.rb5009-01
  bridge            = routeros_interface_bridge.rb5009-01.name
  pvid              = routeros_interface_vlan.rb5009-01_vlan-10.vlan_id
  interface         = routeros_interface_vlan.rb5009-01_vlan-10.name
  frame_types       = "admit-only-vlan-tagged"
  ingress_filtering = true
  hw                = true
  comment           = "piNet (TF)"
}

resource "routeros_interface_bridge_port" "vlan10_port_on_rb5009-02" {
  provider          = routeros.rb5009-02
  bridge            = routeros_interface_bridge.rb5009-02.name
  pvid              = routeros_interface_vlan.rb5009-02_vlan-10.vlan_id
  interface         = routeros_interface_vlan.rb5009-02_vlan-10.name
  frame_types       = "admit-only-vlan-tagged"
  ingress_filtering = true
  hw                = true
  comment           = "piNet (TF)"
}

resource "routeros_interface_bridge_port" "vlan10_port_on_crs305-01" {
  provider          = routeros.crs305-01
  bridge            = routeros_interface_bridge.crs305-01.name
  pvid              = routeros_interface_vlan.crs305-01_vlan-10.vlan_id
  interface         = routeros_interface_vlan.crs305-01_vlan-10.name
  frame_types       = "admit-only-vlan-tagged"
  ingress_filtering = true
  hw                = true
  comment           = "piNet (TF)"
}

resource "routeros_interface_bridge_port" "vlan10_port_on_crs328-01" {
  provider          = routeros.crs328-01
  bridge            = routeros_interface_bridge.crs328-01.name
  pvid              = routeros_interface_vlan.crs328-01_vlan-10.vlan_id
  interface         = routeros_interface_vlan.crs328-01_vlan-10.name
  frame_types       = "admit-only-vlan-tagged"
  ingress_filtering = true
  hw                = true
  comment           = "piNet (TF)"
}

//
// . piNet utility boxes
//
resource "routeros_ip_dhcp_server_lease" "macmini" {
  provider    = routeros.crs328-01
  mac_address = "5C:E9:1E:E4:0E:DD"
  address     = "192.168.10.20"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "pi-manage-01" {
  provider    = routeros.crs328-01
  mac_address = "00:05:1B:DC:FD:AF"
  address     = "192.168.10.21"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "macpro" {
  provider    = routeros.crs328-01
  mac_address = "00:3E:E1:C7:92:39"
  address     = "192.168.10.22"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "pi-print-01" {
  provider    = routeros.crs328-01
  mac_address = "2C:CF:67:0A:E9:AE"
  address     = "192.168.10.40"
  server      = routeros_ip_dhcp_server.vlan10.name

  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "macbook-pro" {
  provider    = routeros.crs328-01
  mac_address = "4C:EA:41:67:63:DB"
  address     = "192.168.10.50"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
//
// piCluster
//
resource "routeros_ip_dhcp_server_lease" "pi-master-01" {
  provider    = routeros.crs328-01
  mac_address = "2C:CF:67:09:99:3F"
  address     = "192.168.10.91"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "pi-master-02" {
  provider    = routeros.crs328-01
  mac_address = "2C:CF:67:09:98:13"
  address     = "192.168.10.92"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "pi-master-03" {
  provider    = routeros.crs328-01
  mac_address = "2C:CF:67:27:49:76"
  address     = "192.168.10.93"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "pi-worker-01" {
  provider    = routeros.crs328-01
  mac_address = "2C:CF:67:09:97:40"
  address     = "192.168.10.101"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}
resource "routeros_ip_dhcp_server_lease" "pi-worker-02" {
  provider    = routeros.crs328-01
  mac_address = "2C:CF:67:09:96:FC"
  address     = "192.168.10.102"
  server      = routeros_ip_dhcp_server.vlan10.name
  comment     = "Terraformed static lease."
}

