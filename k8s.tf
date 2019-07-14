provider "kubernetes" {
  host = "${digitalocean_kubernetes_cluster.personal.endpoint}"

  client_certificate     = "${base64decode(digitalocean_kubernetes_cluster.personal.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(digitalocean_kubernetes_cluster.personal.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(digitalocean_kubernetes_cluster.personal.kube_config.0.cluster_ca_certificate)}"
}

resource "kubernetes_service_account" "system_tiller" {
  metadata {
    name = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "system_tiller" {
  metadata {
    name = "tiller"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = "cluster-admin"
  }
  subject {
    kind = "ServiceAccount"
    name = "tiller"
    namespace = "kube-system"
  }
}
