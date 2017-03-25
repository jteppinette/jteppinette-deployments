resource "digitalocean_floating_ip" "root" {
  droplet_id = "${digitalocean_droplet.swarm-manager.id}"
  region     = "${var.region}"
  depends_on = ["digitalocean_droplet.swarm-manager"]
}

resource "digitalocean_domain" "root" {
  name       = "jteppinette.com"
  ip_address = "${digitalocean_floating_ip.root.ip_address}"
  depends_on = ["digitalocean_floating_ip.root"]
}

resource "digitalocean_record" "api-water-dragon" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "api.water-dragon"
  value  = "@"
}

resource "digitalocean_record" "minio" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "minio"
  value  = "@"
}

resource "digitalocean_record" "risk-managed" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "risk-managed"
  value  = "@"
}

resource "digitalocean_record" "angular-seed" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "angular-seed"
  value  = "@"
}

resource "digitalocean_record" "django-api-seed" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "django-api-seed"
  value  = "@"
}

resource "digitalocean_record" "go-json-api-seed" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "go-json-api-seed"
  value  = "@"
}

resource "digitalocean_record" "amp" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "amp"
  value  = "@"
}
