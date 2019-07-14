# My DigitalOcean Infrastructure Using Terraform

https://www.digitalocean.com/docs/kubernetes/changelog/
https://developers.digitalocean.com/documentation/v2/#kubernetes

## Setup

Step 1:
```
export DO_TOKEN="TOKENVALUEHERE"
```

Step 2:
```
terraform apply  -var "do_token=$DO_TOKEN"
```

Step 3:
```
terraform output kube_config > ~/.kube/config
```

Step 4:
```
./scripts/00-pre-setup/cert-manager.sh 
kubectl apply -f scripts/01-post-setup/
```
