variable "project" {
  type = "string"
}
variable "region" {
  type = "string"
}
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

provider "google" {
  project = "${var.project}"
  region = "${var.region}"
}

module "compute" {
  source = "../../modules/google/compute"
  zone = "${var.zone}"
  sender_instance_num = "${var.sender_instance_num}"
  sender_machine_type = "${var.sender_machine_type}"
  receiver_instance_num = "${var.receiver_instance_num}"
  receiver_machine_type = "${var.receiver_machine_type}"
}
