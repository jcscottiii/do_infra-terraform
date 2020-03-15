resource "helm_release" "k8s_dashboard" {
  name       = "kubernetes-dashboard"
  repository = data.helm_repository.stable.metadata.0.name
  chart      = "kubernetes-dashboard"
  version    = "1.7.1"
  namespace  = "kube-system"
}
