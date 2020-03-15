resource "kubernetes_namespace" "external_dns" {
  metadata {
    name = "external-dns"
  }
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = data.helm_repository.stable.metadata.0.name
  chart      = "external-dns"
  version    = "1.7.9"
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