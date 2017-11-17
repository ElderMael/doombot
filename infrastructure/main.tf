variable "rancher_api_url" {
  description = "Rancher Server API URL"
}

variable "rancher_secret" {
  default = ""
}
variable "rancher_access" {
  default = ""
}

variable "google_keyfile_path" {
  description = "Google API Service Account JSON File"
}

variable "google_project_name" {
  description = "GCE Project Name"
}

variable "region" {
  default = "us-central1"
  description = "Project Region"
}

provider "google" {
  region = "${var.region}"
  project = "${var.google_project_name}"
  credentials = "${file(var.google_keyfile_path)}"
}

resource "google_compute_address" "public_address" {
  name = "tf-doombot-public-address"
}

resource "google_compute_network" "frontend_network" {
  name = "tf-doombot-frontend-network"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "internet" {
  name = "tf-doombot-frontend-firewall"

  network = "${google_compute_network.frontend_network.name}"

  allow {
    protocol = "tcp"
    ports = [
      "80",
      "8080",
      "10999",
      "22"]
  }

}

provider "rancher" {
  api_url = "${var.rancher_api_url}"
  access_key = "${var.rancher_access}"
  secret_key = "${var.rancher_secret}"
}

resource "rancher_environment" "prod" {
  name = "Doombot"
  orchestration = "cattle"
}

resource "rancher_registration_token" "prod_token" {
  name = "prod_token"
  environment_id = "${rancher_environment.prod.id}"
}

resource "rancher_registry" "google_docker_registry" {
  provider = "rancher"
  name = "eldermael_google_registry"
  server_address = "us.gcr.io"
  environment_id = "${rancher_environment.prod.id}"

  connection {
    user = "_json_key"
    password = "${${file(var.google_keyfile_path)}}"
  }
}

resource "google_compute_instance" "rancher_node" {

  name = "tf-doombot-rancher-node"
  zone = "${var.region}-a"
  machine_type = "n1-standard-2"

  tags = [
    "terraform",
    "rancher-node"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20170803"
    }
  }


  network_interface {
    network = "${google_compute_network.frontend_network.self_link}"

    access_config {
    }

  }

  metadata_startup_script = <<SCRIPT
    curl https://releases.rancher.com/install-docker/17.06.sh | sh
    ${rancher_registration_token.prod_token.command}
  SCRIPT

}

output "node_address" {
  value = "http://${google_compute_instance.rancher_node.network_interface.0.access_config.0.assigned_nat_ip}:8080/"
}
