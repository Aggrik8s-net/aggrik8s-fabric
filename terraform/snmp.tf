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
resource "routeros_snmp_community" "pitik-rb5009-01" {
  provider = routeros.rb5009-01
  # authentication_password = data.doppler_secrets.aggrik8s-fabric.map.SNMP_AUTH_PASSWD
  authentication_password = var.snmp_auth_passwd
  # authentication_password = "this-is-a-stupid-problem"
  authentication_protocol = "MD5"
  comment                 = "pitik V3 Community"
  disabled                = true
  # encryption_password     = data.doppler_secrets.aggrik8s-fabric.map.SNMP_ENC_PASSWD
  encryption_password     = var.snmp_enc_passwd
  encryption_protocol     = "DES"
  name                    = "pitik"
  read_access             = true
  security                = "private"
  write_access            = true
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
}
resource "routeros_snmp_community" "aggrik8s_rb5009-01" {
  provider = routeros.rb5009-01
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
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
resource "routeros_snmp_community" "pitik-rb5009-02" {
  provider = routeros.rb5009-02
  # authentication_password = data.doppler_secrets.aggrik8s-fabric.map.SNMP_AUTH_PASSWD
  authentication_password = var.snmp_auth_passwd
  # authentication_password = "this-is-a-stupid-problem"
  authentication_protocol = "MD5"
  comment                 = "pitik v3 Community"
  disabled                = true
  # encryption_password     = data.doppler_secrets.aggrik8s-fabric.map.SNMP_ENC_PASSWD
  encryption_password     = var.snmp_enc_passwd
  encryption_protocol     = "DES"
  name                    = "pitik"
  read_access             = true
  security                = "private"
  write_access            = true
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
}
resource "routeros_snmp_community" "aggrik8s_rb5009-02" {
  provider = routeros.rb5009-02
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
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
resource "routeros_snmp_community" "pitik-crs305-01" {
  provider = routeros.crs305-01
  # authentication_password = data.doppler_secrets.aggrik8s-fabric.map.SNMP_AUTH_PASSWD
  authentication_password = var.snmp_auth_passwd
  # authentication_password = "this-is-a-stupid-problem"
  authentication_protocol = "MD5"
  comment                 = "pitik v3 Community"
  disabled                = true
  # encryption_password     = data.doppler_secrets.aggrik8s-fabric.map.SNMP_ENC_PASSWD
  encryption_password     = var.snmp_enc_passwd
  encryption_protocol     = "DES"
  name                    = "pitik"
  read_access             = true
  security                = "private"
  write_access            = true
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
}
resource "routeros_snmp_community" "aggrik8s_crs305-01" {
  provider = routeros.crs305-01
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
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
resource "routeros_snmp_community" "pitik-crs328-01" {
  provider = routeros.crs328-01
  # authentication_password = data.doppler_secrets.aggrik8s-fabric.map.SNMP_AUTH_PASSWD
  authentication_password = var.snmp_auth_passwd
  # authentication_password = "this-is-a-stupid-problem"
  authentication_protocol = "MD5"
  comment                 = "pitik v3 Community"
  disabled                = true
  # encryption_password     = data.doppler_secrets.aggrik8s-fabric.map.SNMP_ENC_PASSWD
  encryption_password     = var.snmp_enc_passwd
  encryption_protocol     = "DES"
  name                    = "pitik"
  read_access             = true
  security                = "private"
  write_access            = true
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
}
resource "routeros_snmp_community" "aggrik8s_crs328-01" {
  provider = routeros.crs328-01
  addresses = ["192.168.88.50/32", "192.168.88.51/32", "192.168.88.21/32", "192.168.15.27/32", "192.168.10.10/32"]
  name      = "aggrik8s"
}