# resource "google_container_registry" "registry" {
#   project  = var.project
#   location = "EU"

#   provisioner "local-exec" {
#     command =  <<-EOT
#                 sudo docker build . -t my-demo-app -f demo-app/DevOps-Challenge-Demo-Code/Dockerfile 

#                 sudo docker tag my-demo-app eu.gcr.io/"${var.project}"/my-demo-app:1.0 
                
#                  docker push eu.gcr.io/${var.project}/my-demo-app:1.0

#     EOT

#     interpreter = ["/bin/bash", "-c"]
#   }
# }

