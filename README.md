# My DigitalOcean Infrastructure Using Terraform

This repository contains my infrastructure as code configuration (via Terraform) for my DigitalOcean setup.

By running this plan, it will provision a DigitalOcean droplet. Upon provisioning, it will automatically:
- Setup firewall rules to only receive on ports 22, 80, and 443.
- Setup [Dokku](http://dokku.viewdocs.io/dokku/)
- Setup the [Dokku Let's Encrypt Plugin](https://github.com/dokku/dokku-letsencrypt).
- Deploy my [blog](https://jamescsott.io) with an SSL.

## Requirements
- Terraform
- DigitalOcean Account
- Two Domains
 - One for the Dokku API
 - One for my blog.

## Setup

Make a copy of the secrets variables template file.

```sh
cp secrets.tfvars.template secrets.tfvars
```

### Explanation of variables

#### `do_token`
The DigitalOcean API token with both read and write perms.
The token can be generated from this [site](https://cloud.digitalocean.com/settings/api/tokens)

#### `hostname`
The domain for the Dokku API.

#### `blog_hostname`
The domain for the blog.

#### `public_key`
Location of the SSH public key on the machine running Terraform.

#### `private_key`
Location of the SSH private key on the machine running Terraform.

## Using
```sh
# Verify that everything is right
terraform plan -var-file="secrets.tfvars"

# Run the plan
terraform apply -var-file=secrets.tfvars
```
