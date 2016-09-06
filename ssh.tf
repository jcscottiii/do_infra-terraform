# Create a new SSH key
resource "digitalocean_ssh_key" "default" {
    name = "Default Laptop"
    public_key = "${file("${var.public_key}")}"
}
