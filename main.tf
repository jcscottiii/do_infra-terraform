# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

variable "do_token" {
}


resource "digitalocean_kubernetes_cluster" "personal" {
  name    = "personal"
  region  = "nyc1"
  version = "1.14.1-do.4"
  node_pool {
    name       = "personal"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}

output "kube_config" {
  value = "${digitalocean_kubernetes_cluster.personal.kube_config.0.raw_config}"
  sensitive = true
}
