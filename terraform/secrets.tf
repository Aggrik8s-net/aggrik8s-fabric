data "doppler_secrets" "aggrik8s-fabric" {
  project = "aggrik8s-fabric"
  config  = "dev"
}
/*
resource "doppler_secret" "fabric_password" {
//  depends_on = [module.talos-proxmox-east.kubeconfig]
  project = "aggrik8s-fabric"
  config = "dev"
  name = "FABRIC_PASSWORD"
  value = var.fabric_password
}
*/

/*

//
//     Commented out because this creates a secret
//
//     We just want to lookup the secret in snmp.tf.
//
resource "doppler_secret" "snmp_auth_passwd" {
  project    = "aggrik8s-fabric"
  config     = "dev"
  name       = snmp_auth_passwd
  value      = data.doppler_secrets.aggrik8s-fabric.map.SNMP_AUTH_PASSWD
}

resource "doppler_secret" "snmp_enc_passwd" {
  project    = "aggrik8s-fabric"
  config     = "dev"
  snmp_enc_passwd   = data.doppler_secrets.aggrik8s-fabric.map.SNMP_ENC_PASSWD
}

*/

