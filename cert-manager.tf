data "helm_repository" "jetstack" {
  name = "jetstack"
  url  = "https://charts.jetstack.io"
}
resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
    labels = {
      "certmanager.k8s.io/disable-validation" = "true"
    }
  }
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "${data.helm_repository.jetstack.metadata.0.name}"
  chart      = "cert-manager"
  version    = "v0.8.1"
  namespace  = "cert-manager"
}