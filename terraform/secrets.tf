resource "doppler_secret" "fabric_password" {
//  depends_on = [module.talos-proxmox-east.kubeconfig]
  project = "aggrik8s-fabric"
  config = "dev"
  name = "FABRIC_PASSWORD"
  value = var.doppler_token_dev-fabric
}