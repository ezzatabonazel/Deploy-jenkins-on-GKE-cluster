# Deploy-app-at-GKE-with-terraform-GCP
## Description 

create GCP infrastructure using Terraform , create Docker image for python app 

create kubrenetes yaml files and deploy app on GKE cluster

## Architecture

<img src="screenshots/Screenshot from 2022-07-27 20-18-12.png" alt="architecture"/>

# Tools used:

- **Docker:** to build an image from python application.
- **Kubernetes**: container orchestration system for automating python application containers.
- **GCP**: to define GKE cluster to deploy python application on it.
- **Terraform**: provision GCP resources.

# Steps to implement 

## Build docker image and pull redis image:

```bash
$ docker build -t python-app .
$ docker pull redis
```

---

## Push docker images to GCR:

```bash
# auth docker with GCR
$ gcloud auth configure-docker
```

```bash
#  tags the images
$ docker tag python-app eu.gcr.io/<PROJECT-ID>/python-app:latest
$ docker tag redis eu.gcr.io/<PROJECT-ID>/redis:latest
```
```bash
# push the images to GCR
$ docker push eu.gcr.io/<PROJECT-ID>/python-app:latest
$ docker push eu.gcr.io/<PROJECT-ID>/redis:latest
```

---

## provision GCP infrastructure with Terraform :
- You need to have an account and a project on GCP
- Pass values for the variables defined in a file with the terraform.tfvars name as such:
```
project = "YOUR-PROJECT_ID"
region = "us-central1"
vpc_name="gcp-project-vpc"
managment_subnet_cidr="10.0.0.0/24"
managment_subnet_name="managment"
managment_subnet_region= "us-central1"
restricted_subnet_cidr= "10.0.1.0/24"
restricted_subnet_name= "restricted"
restricted_subnet_region= "us-central1"
vm_type="f1-micro"
machine_type = "e2-micro"
node-count = 1
master_ipv4_cidr_block = "172.12.0.0/28"
services_ipv4_cidr_block = "192.168.0.0/16"
pods_ipv4_cidr_block = "172.17.0.0/16"

```

```bash
$ cd ./terraform-infra

# create gcs bucket and path the name in backend.tf file if you want to keep your state file there or delete the backend.tf if you will keep sate file local

# initialize the backend, provider and modules
$ terraform init

## provisioning infrastructure
$ terraform apply

```
> check GKE creation on GCP:

<img src="screenshots/Screenshot from 2022-07-27 19-38-35.png"/>


## Connect to management vm and install gcloud, kubectl and connect on GKE cluster :

```bash
# ssh vm
$ gcloud compute ssh --zone <"us-central1-a"> "managment-vm"  --tunnel-through-iap --project <"project-id">
 # connect cluster
$ gcloud container clusters get-credentials my-gke-cluster --region <region> --project <project-id>
```
<img src="screenshots/Screenshot from 2022-07-27 19-55-58.png"/>

## Copy demo-app k8s to the management instance and deploy the application:

```bash
$ gcloud compute scp <LOCAL_FILE_PATH> <VM_NAME>
```
```bash
# create k8s resources
$ kubectl create -f deployment.yaml 
$ kubectl create -f  service.yaml
$ kubectl create -f  redis.yaml
$ kubectl create -f  redis-svc.yaml
$ kubectl create -f  ingress.yaml
```
<img src="screenshots/Screenshot from 2022-07-27 20-09-58.png"/>



## copy ingress ip and go to your browser :

<img src="screenshots/Screenshot from 2022-07-27 20-10-32.png"/>

