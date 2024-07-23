### ARKANA-VPN-GATEWAY
resource "null_resource" "arkana_vpn_gateway" {

  provisioner "local-exec" {
    command = "bash /home/nagyeman8/GCP-INFRA/modules/vpn/vpn.sh"
    environment = {
      REGION  = var.region
      PROJECT = var.project
    }
  }
}