# My DigitalOcean Infrastructure Using Terraform

https://www.digitalocean.com/docs/kubernetes/changelog/
https://developers.digitalocean.com/documentation/v2/#kubernetes


![Terraform GitHub Actions For Master Merge](https://github.com/jcscottiii/do_infra-terraform/workflows/Terraform%20GitHub%20Actions%20For%20Master%20Merge/badge.svg?branch=master)

## Description
This repository is automated to deploy to master with Terraform

It uses three providers:

- [DigitalOcean](https://www.terraform.io/docs/providers/do/index.html)
- [Kubernetes](https://www.terraform.io/docs/providers/kubernetes/index.html)
- [Helm](https://www.terraform.io/docs/providers/helm/index.html) (currently using Helm v2)

With those three providers, we get the following:

- A Kubernetes cluster using [DigitalOcean's Managed Kubernetes Offering](https://www.digitalocean.com/products/kubernetes/)
- Tiller ServiceAccount for Helm v2 (will go away when migrated to Helm v3)
- [Cert Manager Helm Chart](https://github.com/jetstack/cert-manager/tree/master/deploy/charts/cert-manager) (for getting HTTPS certs via Let's Encrypt)
- [NGINX Ingress Helm Chart](https://github.com/helm/charts/tree/master/stable/nginx-ingress) (for exposing services)
- [External DNS Helm Chart](https://github.com/helm/charts/tree/master/stable/external-dns) (for automatically manipulating DNS records in DigitalOcean)
- [Kubernetes Dashboard](https://github.com/helm/charts/tree/master/stable/kubernetes-dashboard) (for viewing the cluster status)
