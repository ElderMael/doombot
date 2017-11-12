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
  region      = "${var.region}"
  project     = "${var.google_project_name}"
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
  name    = "tf-doombot-frontend-firewall"

  network = "${google_compute_network.frontend_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "10999", "22"]
  }

}

resource "google_compute_instance" "rancher_node" {

  name         = "tf-doombot-rancher-node"
  zone         = "${var.region}-a"
  machine_type = "n1-standard-2"

  tags = [ "terraform", "rancher-node" ]

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
  SCRIPT

}

output "node_address" {
  value = "http://${google_compute_instance.rancher_node.network_interface.0.access_config.0.assigned_nat_ip}:8080/"
}
