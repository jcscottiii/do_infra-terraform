resource "kubernetes_namespace" "nginx" {
  metadata {
    name = "nginx"
  }
}


resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "nginx-ingress"
  version    = "1.33.5"
  namespace  = "nginx"


  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }
}

data "kubernetes_service" "nginx_service" {
  metadata {
    name      = "nginx-ingress-controller"
    namespace = "nginx"
  }
  depends_on = [
    helm_release.nginx_ingress,
  ]
}
