variable "sender_instance_num" {
  type = "string"
}

resource "google_compute_instance" "sender" {
  count = "${var.sender_instance_num}"
  name = "${format("influent-sender%03d", count.index + 1)}"
  machine_type = "n1-highcpu-32"
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
