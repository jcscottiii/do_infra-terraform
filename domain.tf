# Create a new domain record
resource "digitalocean_domain" "dokku" {
  name = "${var.hostname}"
  ip_address = "${digitalocean_droplet.dokku.ipv4_address}"
}

resource "digitalocean_domain" "blog" {
  name = "${var.blog_hostname}"
  ip_address = "${digitalocean_droplet.dokku.ipv4_address}"
}

resource "digitalocean_record" "wildcard" {
  domain = "${digitalocean_domain.dokku.name}"
  type = "CNAME"
  name = "*"
  value = "@"
}
