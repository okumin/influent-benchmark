provider "google" {
  project = "okumin-com"
  region = "asia-northeast1"
}

module "compute" {
  source = "../../modules/google"
  sender_instance_num = 15
  receiver_instance_num = 1
}
