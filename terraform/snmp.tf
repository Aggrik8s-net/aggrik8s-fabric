//
//  RB5009-01
//
//
resource "routeros_snmp" "rb5009-01" {
  provider = routeros.rb5009-01
  contact          = "Dave"
  enabled          = true
  engine_id_suffix = "8a3c"
  location         = "piCluster 6U Rack"
  // trap_community   = "private"
  // trap_generators  = "start-trap"
  // trap_version     = 3
}
resource "routeros_snmp_community" "test_rb5009-01" {
  provider = routeros.rb5009-01
  authentication_password = "authpasswd"
  authentication_protocol = "MD5"
  comment                 = "Test Community"
  disabled                = true
  encryption_password     = "encpassword"
  encryption_protocol     = "DES"
  name                    = "test"
  read_access             = true
  security                = "private"
  write_access            = true
}
resource "routeros_snmp_community" "aggrik8s_rb5009-01" {
  provider = routeros.rb5009-01
  addresses = ["192.168.88.50", "192.168.88.21", "192.168.15.27", "192.168.10.10"]
  name      = "aggrik8s"
}

//
//  RB5009-02
//
//
resource "routeros_snmp" "rb5009-02" {
  provider = routeros.rb5009-02
  contact          = "Dave"
  enabled          = true
  engine_id_suffix = "8a3c"
  location         = "piCluster 6U Rack"
  // trap_community   = "private"
  // trap_generators  = "start-trap"
  // trap_version     = 3
}
resource "routeros_snmp_community" "test_rb5009-02" {
  provider = routeros.rb5009-02
  authentication_password = "authpasswd"
  authentication_protocol = "MD5"
  comment                 = "Test Community"
  disabled                = true
  encryption_password     = "encpassword"
  encryption_protocol     = "DES"
  name                    = "test"
  read_access             = true
  security                = "private"
  write_access            = true
}
resource "routeros_snmp_community" "aggrik8s_rb5009-02" {
  provider = routeros.rb5009-02
  addresses = ["192.168.88.50", "192.168.88.21", "192.168.15.27", "192.168.10.10"]
  name      = "aggrik8s"
}

//
//  CRS305-01
//
//
resource "routeros_snmp" "crs305-01" {
  provider = routeros.crs305-01
  contact          = "Dave"
  enabled          = true
  engine_id_suffix = "8a3c"
  location         = "piCluster 6U Rack"
  // trap_community   = "private"
  // trap_generators  = "start-trap"
  // trap_version     = 3
}
resource "routeros_snmp_community" "test_crs305-01" {
  provider = routeros.crs305-01
  authentication_password = "authpasswd"
  authentication_protocol = "MD5"
  comment                 = "Test Community"
  disabled                = true
  encryption_password     = "encpassword"
  encryption_protocol     = "DES"
  name                    = "test"
  read_access             = true
  security                = "private"
  write_access            = true
}
resource "routeros_snmp_community" "aggrik8s_crs305-01" {
  provider = routeros.crs305-01
  addresses = ["192.168.88.50", "192.168.88.21", "192.168.15.27", "192.168.10.10"]
  name      = "aggrik8s"
}

//
//  RB5009-01
//
//
resource "routeros_snmp" "crs328-01" {
  provider = routeros.crs328-01
  contact          = "Dave"
  enabled          = true
  engine_id_suffix = "8a3c"
  location         = "piCluster 6U Rack"
  // trap_community   = "private"
  // trap_generators  = "start-trap"
  // trap_version     = 3
}
resource "routeros_snmp_community" "test_crs328-01" {
  provider = routeros.crs328-01
  authentication_password = "authpasswd"
  authentication_protocol = "MD5"
  comment                 = "Test Community"
  disabled                = true
  encryption_password     = "encpassword"
  encryption_protocol     = "DES"
  name                    = "test"
  read_access             = true
  security                = "private"
  write_access            = true
}
resource "routeros_snmp_community" "aggrik8s_crs328-01" {
  provider = routeros.crs328-01
  addresses = ["192.168.88.50", "192.168.88.21", "192.168.15.27", "192.168.10.10"]
  name      = "aggrik8s"
}