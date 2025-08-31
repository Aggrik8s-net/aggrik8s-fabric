# Define local variables for the router's configuration
locals {
  router_name_tw = "RB5009-02"
  bgp_asn_tw     = 64513
  vlan2000_id    = 2000
  vlan2000_gw    = "192.168.20.3/24"
  bgp_peer_ip_te = "192.168.88.2"
}

# Add a comment to the router for identification
resource "routeros_system_note" "note_tw" {
  provider = routeros.rb5009-02
  note     = "Managed by Terraform: ${local.router_name_tw}"
}
/*
resource "routeros_routing_bgp_template" "template_vlan1500" {
  provider = routeros.rb5009-01
  name = "vlan1500"
  as   = 65001 # Define a private ASN
  router_id = local.bgp_peer_ip_tw
}

resource "routeros_routing_bgp_connection" "vlan1500_te" {
  provider       = routeros.rb5009-01
  name           = "bgp_peer_vlan1500_te"
  remote_address = local.bgp_peer_ip_te
  remote_as      = 65001
  address_families = ["ipv4"]
  keepalive_time = "10s"
  hold_time      = "30s"
  local_address  = local.bgp_peer_ip_tw
}

# BGP network advertisement
resource "routeros_routing_bgp_network" "vlan1500_te" {
  network = cidrnetmask(local.vlan1500_gw)
}

resource "routeros_routing_bgp_network" "vlan2000" {
  network = cidrnetmask(local.vlan1500_gw)
}


# Configure BGP instance
resource "routeros_routing_bgp_instance" "bgp_instance_tw" {
  provider = routeros.rb5009-02
  as       = local.bgp_asn_tw
  router_id = local.bgp_peer_ip_tw
}

# Add BGP peer for RB5009-01
resource "routeros_routing_bgp_peer" "peer_rb5009_01_tw" {
  provider = routeros.rb5009-02
  name     = "peer-rb5009-01"
  remote_address = local.bgp_peer_ip_te
  remote_as      = local.bgp_asn_te
  instance       = routeros_routing_bgp_instance.bgp_instance_tw.router_id
  update_source  = local.bgp_peer_ip_tw # Force BGP over the internal network
}

# Advertise the talos-west network to RB5009-01
resource "routeros_routing_bgp_network" "talos_west_network" {
  provider = routeros.rb5009-02
  network  = "192.168.20.0/24"
}
*/

//
//  VLAN2000
//
resource "routeros_routing_bgp_template" "template_vlan2000" {
  provider = routeros.rb5009-02
  name = "vlan2000"
  as   = 65002 # Define a private ASN
  router_id = cidrhost(local.vlan2000_gw, 3)
}

resource "routeros_routing_bgp_connection" "vlan2000" {
  provider       = routeros.rb5009-02
  name           = "vlan2000"
  as             = 65002
  router_id      = cidrhost(local.vlan2000_gw, 3)
  local {
    role         = "ibgp"
  }
  remote {
    address      = cidrhost(local.vlan1500_gw, 2)
    as           = 65001
  }

  // remote_as      = 65001
  address_families = "ip"
  keepalive_time = "10s"
  hold_time      = "30s"
  // local_address  =  cidrhost(local.vlan2000_gw, 3)
}

/*
//
// Not available in v1.86.3 ...
//
// This is now set by routeros_routing_bgp_connection
//
# BGP network advertisement
resource " c" "vlan1500_tw" {
  provider       = routeros.rb5009-02
  network = cidrnetmask(local.vlan1500_gw)
}

resource "routeros_routing_bgp_network" "vlan2000_tw" {
  provider       = routeros.rb5009-02
  network = cidrnetmask(local.vlan2000_gw)
}
*/