variable "zone" {
  type = "string"
}
variable "sender_instance_num" {
  type = "string"
}
variable "sender_machine_type" {
  type = "string"
}
variable "receiver_instance_num" {
  type = "string"
}
variable "receiver_machine_type" {
  type = "string"
}

resource "google_compute_instance" "sender" {
  count = "${var.sender_instance_num}"
  name = "${format("influent-sender%03d", count.index + 1)}"
  machine_type = "${var.sender_machine_type}"
  zone = "${var.zone}"

  disk {
    image = "centos-7"
    type = "pd-standard"
    size = 100
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  scheduling {
    preemptible = true
  }
}

resource "google_compute_instance" "receiver" {
  count = "${var.receiver_instance_num}"
  name = "${format("influent-receiver%03d", count.index + 1)}"
  machine_type = "${var.receiver_machine_type}"
  zone = "${var.zone}"

  disk {
    image = "centos-7"
    type = "pd-standard"
    size = 100
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  scheduling {
    preemptible = true
  }
}
