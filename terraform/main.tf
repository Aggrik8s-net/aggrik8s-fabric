# main.tf

// resource "routeros_ip_dhcp_server_lease" "dhcp_lease" {
//   address     = "192.168.20.50"
//   mac_address = "AA:BB:CC:DD:11:22"
// }

/*
resource "routeros_interface_ethernet_switch_host" "crs328-01" {
  provider    = routeros.crs328-01
//terraform import routeros_interface_ethernet_switch_host.test *0  switch      = "switch1"
  mac_address = "F4:1E:57:53:A7:17"
//  ports       = ["ether1"]
//  mirror      = true
}
*/

/*
resource "routeros_interface_bridge" "rb5009-02" {
  provider       = routeros.rb5009-02
  name           = "bridge"
  admin_mac      = "78:9A:18:D3:36:3E"
}
*/

resource "routeros_interface_bridge" "crs305-01" {
  provider            = routeros.crs305-01
  // actual_mtu          = 1500
  admin_mac           = "D4:01:C3:AE:B9:87"
  ageing_time         = "5m"
  arp                 = "enabled"
  arp_timeout         = "auto"
  auto_mac            = false
  comment             = "defconf"
  dhcp_snooping       = false
  disabled            = false
  // dynamic             = false
  ether_type          = "0x8100"
  fast_forward        = true
  forward_delay       = "15s"
  frame_types         = "admit-all"
  // id                  = "*7"
  igmp_snooping       = false
  ingress_filtering   = true
  // l2mtu               = 1592
  // mac_address         = "D4:01:C3:AE:B9:87"
  max_learned_entries = "auto"
  max_message_age     = "20s"
  mtu                 = "auto"
  mvrp                = false
  name                = "bridge"
  port_cost_mode      = "long"
  priority            = "0x8000"
  protocol_mode       = "rstp"
  pvid                = 1
  // running             = true
  transmit_hold_count = 6
  vlan_filtering      = true
}



//
//
//  crs328-01 VLAN2000
//
//


resource "routeros_interface_bridge" "crs328-01" {
  provider            = routeros.crs328-01
  name                = "bridge"
  // actual_mtu          = 1500
  admin_mac           = "F4:1E:57:53:A7:17"
  ageing_time         = "5m"
  arp                 = "enabled"
  arp_timeout         = "auto"
  auto_mac            = false
  comment             = "defconf"
  dhcp_snooping       = false
  disabled            = false
  // dynamic             = false
  ether_type          = "0x8100"
  fast_forward        = true
  forward_delay       = "15s"
  frame_types         = "admit-all"
  // id                  = "*1E"
  igmp_snooping       = false
  ingress_filtering   = true
  // l2mtu               = 1592
  // mac_address         = "F4:1E:57:53:A7:17"
  max_learned_entries = "auto"
  max_message_age     = "20s"
  mtu                 = "auto"
  mvrp                = false
  port_cost_mode      = "long"
  priority            = "0x8000"
  protocol_mode       = "rstp"
  pvid                = 1
  // running             = true
  transmit_hold_count = 6
  vlan_filtering      = true
}






// data "routeros_interfaces" "rb5009-01" {
//   provider = routeros.rb5009-01
// }

// data "routeros_interfaces" "rb5009-02" {
// provider = routeros.rb5009-02
// }

// data "routeros_interfaces" "crs305-01" {
//   provider = routeros.crs305-01
// }

// data "routeros_interfaces" "crs328-01" {
//   provider = routeros.crs328-01
// }# routeros_interface_bridge.crs305-01:
# routeros_interface_bridge.rb5009-01:
resource "routeros_interface_bridge" "rb5009-01" {
    provider            = routeros.rb5009-01
    // actual_mtu          = 1500
    admin_mac           = "78:9A:18:A5:FB:61"
    ageing_time         = "5m"
    arp                 = "enabled"
    arp_timeout         = "auto"
    auto_mac            = false
    comment             = "bridge"
    dhcp_snooping       = false
    disabled            = false
    // dynamic             = false
    ether_type          = "0x8100"
    fast_forward        = true
    forward_delay       = "15s"
    frame_types         = "admit-all"
    // id                  = "*B"
    igmp_snooping       = false
    ingress_filtering   = true
    // l2mtu               = 1514
    // mac_address         = "78:9A:18:A5:FB:61"
    max_learned_entries = "auto"
    max_message_age     = "20s"
    mtu                 = "auto"
    mvrp                = false
    name                = "bridge"
    port_cost_mode      = "long"
    priority            = "0x8000"
    protocol_mode       = "rstp"
    pvid                = 1
    // running             = true
    transmit_hold_count = 6
    vlan_filtering      = true
}
# routeros_interface_bridge.rb5009-02:
resource "routeros_interface_bridge" "rb5009-02" {
    provider            = routeros.rb5009-02
    // actual_mtu          = 1500
    admin_mac           = "78:9A:18:D3:36:3E"
    ageing_time         = "5m"
    arp                 = "enabled"
    arp_timeout         = "auto"
    auto_mac            = false
    comment             = "defconf"
    dhcp_snooping       = false
    disabled            = false
    // dynamic             = false
    ether_type          = "0x8100"
    fast_forward        = true
    forward_delay       = "15s"
    frame_types         = "admit-all"
    // id                  = "*B"
    igmp_snooping       = false
    ingress_filtering   = true
    // l2mtu               = 1514
    // mac_address         = "78:9A:18:D3:36:3E"
    max_learned_entries = "auto"
    max_message_age     = "20s"
    mtu                 = "auto"
    mvrp                = false
    name                = "bridge"
    port_cost_mode      = "long"
    priority            = "0x8000"
    protocol_mode       = "rstp"
    pvid                = 1
    // running             = true
    transmit_hold_count = 6
    vlan_filtering      = true
}
