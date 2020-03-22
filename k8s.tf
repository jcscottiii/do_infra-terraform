provider "kubernetes" {
  host = digitalocean_kubernetes_cluster.personal.endpoint

  client_certificate     = base64decode(digitalocean_kubernetes_cluster.personal.kube_config.0.client_certificate)
  client_key             = base64decode(digitalocean_kubernetes_cluster.personal.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.personal.kube_config.0.cluster_ca_certificate)
  token                  = digitalocean_kubernetes_cluster.personal.kube_config.0.token
  load_config_file       = false
}

module "jamescscott-io" {
  source = "./app"
  name   = "jamescscott-io"
}
