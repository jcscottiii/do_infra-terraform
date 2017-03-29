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
    provisioner "file" {
        source = "create-user.sh"
        destination = "/tmp/create-user.sh"
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "file" {
        source = "cleanup.sh"
        destination = "/tmp/cleanup.sh"
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "file" {
        source = "elevate-user.sh"
        destination = "/tmp/elevate-user.sh"
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "file" {
        source = "add-ssh-key.sh"
        destination = "/tmp/add-ssh-key.sh"
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "remote-exec" {
        inline = [
          "chmod +x /tmp/bootstrap.sh",
          "chmod +x /tmp/create-user.sh",
          "chmod +x /tmp/add-ssh-key.sh",
          "chmod +x /tmp/elevate-user.sh",
          "chmod +x /tmp/bootstrap.sh",
          "/tmp/bootstrap.sh",
          "/tmp/create-user.sh james \"${var.user_one_pub_key}\"",
          "/tmp/elevate-user.sh james",
          "/tmp/add-ssh-key.sh weddingciuser \"${var.wedding_ci_user_pub_key}\"",
        ]
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "remote-exec" {
        inline = [
          "chmod +x /tmp/cleanup.sh",
          "/tmp/cleanup.sh"
        ]
        connection {
            user = "root"
            private_key = "${file("${var.private_key}")}"
        }
    }
    provisioner "local-exec" {
        command = "echo \"Run ./deploy.sh ${digitalocean_droplet.dokku.ipv4_address} james\""
    }
}
