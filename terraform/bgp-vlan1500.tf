# Define local variables for the router's configuration
locals {
  router_name     = "RB5009-01"
  bgp_asn_te      = 64512
  vlan1500_id     = 1500
  vlan1500_gw     = "192.168.15.2/24"
  bgp_peer_ip_tw = "192.168.88.3"
}

# Add a comment to the router for identification
resource "routeros_system_note" "note_te" {
  provider = routeros.rb5009-01
  note     = "Managed by Terraform: ${local.router_name}"
}

/*
# Configure BGP instance
resource "routeros_routing_bgp_instance" "bgp_instance_te" {
  provider = routeros.rb5009-01
  as       = local.bgp_asn_te
  router_id = local.bgp_peer_ip_te
}

# Add BGP peer for RB5009-02
resource "routeros_routing_bgp_peer" "peer_rb5009_02" {
  provider = routeros.rb5009-01
  name     = "peer-rb5009-02"
  remote_address = local.bgp_peer_ip_tw
  remote_as      = local.bgp_asn_tw
  instance       = routeros_routing_bgp_instance.bgp_instance_te.router_id
  update_source  = local.bgp_peer_ip_te # Force BGP over the internal network
  #  update_source  = "192.168.88.2" # Force BGP over the internal network
}

# Advertise the talos-east network to RB5009-02
resource "routeros_routing_bgp_network" "talos_east_network" {
  provider = routeros.rb5009-01
  network  = "192.168.15.0/24"
}
*/

# BGP configuration
resource "routeros_routing_bgp_template" "template_vlan1500" {
  provider = routeros.rb5009-01
  name = "vlan1500"
  as   = 65001 # Define a private ASN
  router_id =  cidrhost(local.vlan1500_gw, 2)
}

resource "routeros_routing_bgp_connection" "vlan1500" {
  provider       = routeros.rb5009-01
  name           = "vlan1500"
  as             = 65001
  router_id      = cidrhost(local.vlan1500_gw, 2)
  local {
    role         = "ibgp"

  }
  remote {
    address      = cidrhost(local.vlan2000_gw, 3)
    as           = 65002
  }
  // remote_as      = 65002
  address_families = "ip"
  keepalive_time = "10s"
  hold_time      = "30s"
  // local_address  =  cidrhost(local.vlan1500_gw, 2)
}
/*
# BGP network advertisement
resource "routeros_routing_bgp_network" "vlan1500_te" {
  provider       = routeros.rb5009-01
  network = cidrnetmask(local.vlan1500_gw)
}

resource "routeros_routing_bgp_network" "vlan2000_te" {
  provider       = routeros.rb5009-01
  network = cidrnetmask(local.vlan2000_gw)
}
*/