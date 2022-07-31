resource "google_compute_firewall" "ssh_rule" {
  name        = "allow-ssh"
  network     = google_compute_network.vpc.id
  description = "allow ssh from only IAP "

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }
direction= "INGRESS"
source_ranges = [ "35.235.240.0/20" ]
priority = 700

}





resource "google_compute_firewall" "restricted_rule" {
    name    = "task-firewall-2"
    network = google_compute_network.vpc.id
    source_ranges  = [ var.restricted_subnet_cidr ] 
    direction= "EGRESS"
    priority = 1200

   allow {
    protocol  = "tcp"
    ports     = ["80", "443"]
   }
 }
