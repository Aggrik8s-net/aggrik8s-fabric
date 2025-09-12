// crs305-01

# Create a virtual loopback bridge interface with no ports
//import {
//  to = routeros_interface_bridge.ospf_loopback_crs305-01
//  id = "*1"
//}

// resource "routeros_interface_bridge" "ospf_loopback_crs305-01" {
//   provider  = routeros.crs305-01 
//   name = "bridge"
// }

# Assign a unique IP address to the loopback interface
resource "routeros_ip_address" "ospf_loopback_ip_crs305-01" {
  provider  = routeros.crs305-01 
  address   = "10.1.1.4/32"
  # interface = routeros_interface_bridge.ospf_loopback_crs305-01.name
  interface = "lo"
}

resource "routeros_routing_ospf_instance" "main_ospf_instance_crs305-01" {
  provider  = routeros.crs305-01 
  name      = "backbone"
  originate_default  = "always"
  # router_id = "10.1.1.4" # Example loopback IP
  router_id = "id-1" # Example loopback IP
}

resource "routeros_routing_ospf_area" "backbone_area_crs305-01" {
  provider  = routeros.crs305-01 
  instance  = routeros_routing_ospf_instance.main_ospf_instance_crs305-01.name
  name      = "backbone"
  area_id   = "0.0.0.0"
}

# Configure OSPF to include the loopback interface
# Set it as "passive" since it is not a physical interface
resource "routeros_routing_ospf_interface_template" "ospf_loopback_template_crs305-01" {
  provider   = routeros.crs305-01 
  area       = "backbone"
  # interfaces = [ "bridge" ]
  interfaces = ["bridge"]
  passive    = false
}

# Import our working OSPF Interfacve Template
//import {
//  to = routeros_routing_ospf_interface_template.backbone_ospf_interface_template_crs305-01
//  id = "0"
//}

// resource "routeros_routing_ospf_interface_template" "backbone_ospf_interface_template_crs305-01" {
//   provider   = routeros.crs305-01 
//   area       = routeros_routing_ospf_area.backbone_area_crs305-01.name
//   interfaces = ["bridge","vlan10","vlan1500","vlan2000"] 
//   type       = "broadcast"
//   // what do we want to advertised as routes
//   networks = [
//     "192.168.10.0/24",
//     "192.168.15.0/24",
//     "192.168.20.0/24",
//   ]
// 
// }

// resource "routeros_routing_ospf_network" "lan_network" {
//    provider  = routeros.crs305-01 
//   network = "192.168.88.0/24"
//   area    = routeros_routing_ospf_area.backbone_area_crs305-01.name
// }

//
// rb5009-01
//
// Import loopbackinterface with no ports
// import {
//   to = routeros_interface_bridge.ospf_loopback_rb5009-01
//   id = "*1"
// }

// # Create a virtual loopback bridge interface with no ports
// resource "routeros_interface_bridge" "ospf_loopback_rb5009-01" {
//   provider  = routeros.rb5009-01 
//   name = "bridge"
// }
# Assign a unique IP address to the loopback interface
resource "routeros_ip_address" "ospf_loopback_ip_rb5009-01" {
  provider  = routeros.rb5009-01 
  address   = "10.1.1.2/32"
  # interface = routeros_interface_bridge.ospf_loopback_rb5009-01.name
  interface = "lo"
}

# Configure OSPF to include the loopback interface
# Set it as "passive" since it is not a physical interface
resource "routeros_routing_ospf_interface_template" "ospf_loopback_template_rb5009-01" {
  provider   = routeros.rb5009-01 
  area       = "backbone"
  # interfaces = [routeros_interface_bridge.ospf_loopback_rb5009-01.name]
  interfaces = ["bridge"]
  passive    = false
}

// resource "routeros_routing_ospf_interface_template" "backbone_ospf_interface_template_crs305-01" {
//   provider  = routeros.rb5009-01 
//   area = routeros_routing_ospf_area.backbone_area_rb5009-01.name
//   // what do we want to advertised as routes
// //  networks = [
// //    "192.168.10.0/24",
// //    "192.168.15.0/24",
// //    "192.168.20.0/24",
// //  ]
// }


// # Import our working OSPF Interfacve Template
// import {
//   to = routeros_routing_ospf_instance.main_ospf_instance_rb5009-01
//   id = "*A"
// }
resource "routeros_routing_ospf_instance" "main_ospf_instance_rb5009-01" {
  provider  = routeros.rb5009-01 
  name      = "rb5009-01-backbone"
  originate_default  = "always"
  #router_id = "10.1.1.2" # Example loopback IP
  router_id = "id-1" 
}

resource "routeros_routing_ospf_area" "backbone_area_rb5009-01" {
  provider  = routeros.rb5009-01 
  instance  = routeros_routing_ospf_instance.main_ospf_instance_rb5009-01.name
  name      = "backbone"
  area_id   = "0.0.0.0"
}

resource "routeros_routing_ospf_interface_template" "backbone_ospf_interface_template_rb5009-01" {
  provider  = routeros.rb5009-01 
  area = routeros_routing_ospf_area.backbone_area_rb5009-01.name
  // what do we want to advertised as routes
  networks = [
    "192.168.15.0/24",
  ]
}
/*
resource "routeros_routing_ospf_interface" "ether1_ospf" {
  provider  = routeros.crs305-01 
  interface = "ether1"
  area      = routeros_routing_ospf_area.backbone_area_rb5009-01.name
  cost      = 10
}
*/

// rb5009-02
# Create a virtual loopback bridge interface with no ports
resource "routeros_interface_bridge" "ospf_loopback_rb5009-02" {
  provider  = routeros.rb5009-02 
  name = "ospf-loopback"
}
# Assign a unique IP address to the loopback interface
resource "routeros_ip_address" "ospf_loopback_ip_rb5009-02" {
  provider  = routeros.rb5009-02 
  address   = "10.1.1.3/32"
  # interface = routeros_interface_bridge.ospf_loopback_rb5009-02.name
  interface = "lo"
}
# Configure OSPF to include the loopback interface
# Set it as "passive" since it is not a physical interface
resource "routeros_routing_ospf_interface_template" "ospf_loopback_template_rb5009-02" {
  provider  = routeros.rb5009-02 
  area       = "backbone"
  # interfaces = [routeros_interface_bridge.ospf_loopback_rb5009-02.name]
  interfaces = ["bridge"]
  passive    = false
}

// resource "routeros_routing_ospf_interface_template" "backbone_ospf_interface_template_rb5009-02" {
//   provider  = routeros.rb5009-02 
//   area = routeros_routing_ospf_area.backbone_area_rb5009-02.name
//   // what do we want to advertised as routes
// //  networks = [
// //    "192.168.10.0/24",
// //    "192.168.15.0/24",
// //    "192.168.20.0/24",
// //  ]
// }

resource "routeros_routing_ospf_instance" "main_ospf_instance_rb5009-02" {
  provider  = routeros.rb5009-02 
  name      = "rb5009-02-backbone"
  originate_default  = "always"
  # router_id = "10.1.1.3" # Example loopback IP
  router_id = "id-1" # Example loopback IP
}

resource "routeros_routing_ospf_area" "backbone_area_rb5009-02" {
  provider  = routeros.rb5009-02 
  instance  = routeros_routing_ospf_instance.main_ospf_instance_rb5009-02.name
  name      = "backbone"
  area_id   = "0.0.0.0"
}

resource "routeros_routing_ospf_interface_template" "backbone_ospf_interface_template_rb5009-02" {
  provider  = routeros.rb5009-02 
  area = routeros_routing_ospf_area.backbone_area_rb5009-02.name
  // what do we want to advertised as routes
  networks = [
    "192.168.20.0/24",
  ]
}

/*
resource "routeros_routing_ospf_interface" "ether1_ospf" {
  provider  = routeros.rb5009-02 
  # interface = "bridge"
  interfaces = [ether1"]
  area      = routeros_routing_ospf_area.backbone_area_rb5009-02.name
  cost      = 10
}
*/

// crs328-01
# Create a virtual loopback bridge interface with no ports
resource "routeros_interface_bridge" "ospf_loopback_crs328-01" {
  provider  = routeros.crs328-01 
  name = "ospf-loopback"
}
# Assign a unique IP address to the loopback interface
resource "routeros_ip_address" "ospf_loopback_ip_crs328-01" {
  provider  = routeros.crs328-01 
  address   = "10.1.1.5/32"
  # interface = routeros_interface_bridge.ospf_loopback_crs328-01.name
  interface = "lo"
}
  
# Configure OSPF to include the loopback interface
# Set it as "passive" since it is not a physical interface
resource "routeros_routing_ospf_interface_template" "ospf_loopback_template_crs328-01" {
  provider   = routeros.crs328-01 
  area       = "backbone"
  #interfaces = [routeros_interface_bridge.ospf_loopback_crs328-01.name]
  interfaces = ["bridge"]
  passive    = false
}

// resource "routeros_routing_ospf_interface_template" "backbone_ospf_interface_template_crs328-01" {
//   provider  = routeros.crs328-01 
//   area = routeros_routing_ospf_area.backbone_area_crs328-01.name
//   // what do we want to advertised as routes
//  networks = [
//    "192.168.10.0/24",
//    "192.168.15.0/24",
//    "192.168.20.0/24",
//  ]
// }

resource "routeros_routing_ospf_instance" "main_ospf_instance_crs328-01" {
  provider  = routeros.crs328-01 
  name      = "crs328-01-backbone"
  originate_default  = "always"
  # router_id = "10.1.1.5" # Example loopback IP
  router_id = "id-1" # Example loopback IP
}

resource "routeros_routing_ospf_area" "backbone_area_crs328-01" {
  provider  = routeros.crs328-01 
  instance  = routeros_routing_ospf_instance.main_ospf_instance_crs328-01.name
  name      = "backbone"
  area_id   = "0.0.0.0"
}

// resource "routeros_routing_ospf_network" "lan_network" {
//    provider  = routeros.crs328-01 
//   network = "192.168.88.0/24"
//   area    = routeros_routing_ospf_area.backbone_area_crs328-01.name
// }

resource "routeros_routing_ospf_interface_template" "backbone_ospf_interface_template_crs328-01" {
  provider  = routeros.crs328-01 
  area = routeros_routing_ospf_area.backbone_area_crs328-01.name
  // what do we want to advertised as routes
  networks = [
    "192.168.10.0/24",
  ]
}
/*
resource "routeros_routing_ospf_interface" "ether1_ospf" {
  provider  = routeros.crs328-01 
  # interface = "bridge"
  interfaces = ["ether1"]
  area      = routeros_routing_ospf_area.backbone_area_crs328-01.name
  cost      = 10
}
*/
