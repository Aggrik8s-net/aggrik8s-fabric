data "doppler_secrets" "this" {
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