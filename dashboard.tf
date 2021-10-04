resource "helm_release" "k8s_dashboard" {
  name       = "kubernetes-dashboard"
  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "kubernetes-dashboard"
  version    = "1.7.1"
  namespace  = "kube-system"
}
