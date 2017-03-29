variable "do_token" {}
variable "hostname" {}
variable "blog_hostname" {}
variable "wedding_domain" {}
variable "public_key" {}
variable "private_key" {}
variable "user_one_pub_key" {}
variable "wedding_ci_user_pub_key" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
    token = "${var.do_token}"
}
