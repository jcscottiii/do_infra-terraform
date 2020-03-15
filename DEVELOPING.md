## This notes are outdated

## Setup

Step 0:

```
# One time only
terraform init
```

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

https://gist.github.com/jamesbuckett/0f4c657ff8b3b9590e1625149b299f77
kubectl -n rook-ceph patch cephclusters.ceph.rook.io rook-ceph -p '{"metadata":{"finalizers": []}}' --type=merge