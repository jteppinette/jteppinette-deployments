resource "digitalocean_tag" "swarm" {
  name = "swarm"
}

resource "digitalocean_tag" "worker" {
  name = "worker"
}

resource "digitalocean_tag" "manager" {
  name = "manager"
}
