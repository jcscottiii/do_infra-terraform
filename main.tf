variable "do_token" {}
variable "hostname" {}
variable "blog_hostname" {}
variable "public_key" {}
variable "private_key" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
    token = "${var.do_token}"
}
