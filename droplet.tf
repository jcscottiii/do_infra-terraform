resource "digitalocean_droplet" "dokku" {
    image = "ubuntu-14-04-x64"
    name = "dokku"
    region = "nyc3"
    size = "1gb"
    ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
    provisioner "file" {
        source = "bootstrap.sh"
        destination = "/tmp/bootstrap.sh"
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "remote-exec" {
        inline = [
          "chmod +x /tmp/bootstrap.sh",
          "/tmp/bootstrap.sh"
        ]
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "local-exec" {
        command = "./deploy.sh ${digitalocean_droplet.dokku.ipv4_address}"
    }
}
