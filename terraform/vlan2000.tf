resource "routeros_interface_bridge_vlan" "vlan2000_rb5009-01" {
  provider   = routeros.rb5009-01
  bridge     = routeros_interface_bridge.rb5009-01.name
  vlan_ids   = [routeros_interface_vlan.rb5009-01_vlan-2000.vlan_id]
  tagged     = ["bridge", "ether2", "sfp-sfpplus1"]
  untagged   = ["ether5", "ether6", "ether7", "ether8"]        # Example port
}

resource "routeros_interface_bridge_vlan" "vlan2000_rb5009-02" {
  provider   = routeros.rb5009-02
  bridge     = routeros_interface_bridge.rb5009-02.name
  vlan_ids   = [routeros_interface_vlan.rb5009-02_vlan-2000.vlan_id]
  tagged     = ["bridge", "ether2", "sfp-sfpplus1"]
  untagged   = ["ether5", "ether6", "ether7", "ether8"]        # Example port
}

resource "routeros_interface_bridge_vlan" "vlan2000_crs305-01" {
  provider   = routeros.crs305-01
  bridge     = routeros_interface_bridge.crs305-01.name
  vlan_ids   = [routeros_interface_vlan.crs305-01_vlan-2000.vlan_id]
  tagged     = ["bridge", "sfp-sfpplus1", "sfp-sfpplus2", "sfp-sfpplus3"]
  untagged   = []        # Example port
}

resource "routeros_interface_bridge_vlan" "vlan2000_crs328-01" {
  provider   = routeros.crs328-01
  bridge     = routeros_interface_bridge.crs328-01.name
  vlan_ids   = [routeros_interface_vlan.crs328-01_vlan-2000.vlan_id]
  tagged     = ["bridge", "ether18", "sfp-sfpplus1", "sfp-sfpplus3", "sfp-sfpplus4"]
  untagged   = ["ether17"]        # Example port
}

resource "routeros_ip_dhcp_server_network" "vlan2000" {
  provider = routeros.crs328-01
  address    = "192.168.20.0/24"
  gateway    = "192.168.20.2"
  dns_server = ["8.8.8.8, 8.8.4.4"]
}

resource "routeros_ip_pool" "vlan200_core" {
  provider = routeros.crs328-01
  name   = "vlan2000"
  ranges = ["192.168.20.20-192.168.20.127"]
}

resource "routeros_ip_dhcp_server" "vlan2000" {
  provider     = routeros.crs328-01
  address_pool = routeros_ip_pool.vlan200_core.id
  interface    = routeros_interface_bridge.crs328-01.name
  name         = "dhcp_vlan2000"
  comment      = "DHCP server for vlan2000."

  //  lifecycle {
  //    ignore_changes = [
  //      address_pool,
  //      comment,
  //    ]
}

resource "routeros_interface_vlan" "crs305-01_vlan-2000" {
  provider = routeros.crs305-01
  name      = "VLAN_2000"
  vlan_id   = 2000
  interface = routeros_interface_bridge.crs328-01.name
}

resource "routeros_interface_vlan" "rb5009-01_vlan-2000" {
  provider = routeros.rb5009-01
  name      = "VLAN_2000"
  vlan_id   = 2000
  interface = routeros_interface_bridge.rb5009-01.name
}

resource "routeros_interface_vlan" "rb5009-02_vlan-2000" {
  provider = routeros.rb5009-02
  name      = "VLAN_2000"
  vlan_id   = 2000
  interface = routeros_interface_bridge.rb5009-02.name
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "rb5009-01_vlan-2000_address" {
  provider = routeros.rb5009-01
  address   = "192.168.20.2/24"
  interface = routeros_interface_vlan.rb5009-01_vlan-2000.name
  comment   = "VLAN2000"
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "rb5009-02_vlan-2000_address" {
  provider = routeros.rb5009-02
  address   = "192.168.20.3/24"
  interface = routeros_interface_vlan.rb5009-02_vlan-2000.name
  comment   = "VLAN2000"
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "crs305-01_vlan-2000_address" {
  provider = routeros.crs305-01
  address   = "192.168.20.4/24"
  interface = routeros_interface_vlan.crs305-01_vlan-2000.name
  comment   = "VLAN2000"
}

resource "routeros_interface_bridge_port" "vlan2000_port_on_crs305-01" {
  provider  = routeros.crs305-01
  bridge    = routeros_interface_bridge.crs305-01.name
  interface = routeros_interface_vlan.crs305-01_vlan-2000.name
}

resource "routeros_interface_vlan" "crs328-01_vlan-2000" {
  provider = routeros.crs328-01
  name      = "VLAN_2000"
  vlan_id   = 2000
  interface = "bridge" # Parent interface where the VLAN will be created
}

# Assign an IP address to the VLAN interface
resource "routeros_ip_address" "crs328-01_vlan-2000_address" {
  provider = routeros.crs328-01
  address   = "192.168.20.5/24"
  interface = routeros_interface_vlan.crs328-01_vlan-2000.name
}

resource "routeros_interface_bridge_port" "vlan2000_port_on_rb5009-01" {
  provider  = routeros.rb5009-01
  bridge    = routeros_interface_bridge.rb5009-01.name
  interface = routeros_interface_vlan.rb5009-01_vlan-2000.name
}

resource "routeros_interface_bridge_port" "vlan2000_port_on_rb5009-02" {
  provider  = routeros.rb5009-02
  bridge    = routeros_interface_bridge.rb5009-02.name
  interface = routeros_interface_vlan.rb5009-02_vlan-2000.name
}

resource "routeros_interface_bridge_port" "vlan2000_port_on_crs328-01" {
  provider  = routeros.crs328-01
  bridge    = routeros_interface_bridge.crs328-01.name
  interface = routeros_interface_vlan.crs328-01_vlan-2000.name
}
