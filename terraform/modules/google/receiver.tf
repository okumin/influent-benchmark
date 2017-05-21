variable "receiver_instance_num" {
  type = "string"
}

resource "google_compute_instance" "receiver" {
  count = "${var.receiver_instance_num}"
  name = "${format("influent-receiver%03d", count.index + 1)}"
  machine_type = "n1-highcpu-64"
  zone = "asia-northeast1-a"

  disk {
    image = "centos-7"
    type = "pd-standard"
    size = 10
  }

  network_interface {
    network = "default"
  }

  scheduling {
    preemptible = true
  }
}
