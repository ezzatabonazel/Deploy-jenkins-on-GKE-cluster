resource "google_compute_firewall" "ssh_rule" {
  name        = "global-ssh"
  network     = google_compute_network.vpc.id
  description = "allow ssh "

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }
direction= "INGRESS"
source_ranges = [ "0.0.0.0/0" ]
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

resource "google_compute_firewall" "http" {
  name        = "allow-http"
  network     = google_compute_network.vpc.id
  description = "allow http  "

  allow {
    protocol  = "tcp"
    ports     = ["80", "443" , "8080"]
  }
direction= "INGRESS"
source_ranges = [ "0.0.0.0/0" ]
priority = 700

}
