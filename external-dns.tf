resource "kubernetes_namespace" "external_dns" {
  metadata {
    name = "external-dns"
  }
}

data "helm_repository" "bitnami" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = data.helm_repository.bitnami.metadata.0.name
  chart      = "bitnami/external-dns"
  version    = "2.20.5"
  namespace  = "external-dns"

  set_sensitive {
    name  = "digitalocean.apiToken"
    value = var.do_token
  }
  set {
    name  = "rbac.create"
    value = "true"
  }
  set {
    name  = "provider"
    value = "digitalocean"
  }
}