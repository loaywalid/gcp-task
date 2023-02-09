# GCP Project 

# Project Overview
this project is a simple infrastructure which have a vpc with two subents [managment - restricted] 
managment subnet contains : 
Nat-Gateway and a private virtual machine

restricted subnet contains : 
private standard GKE cluster (private control plane)

important notes : 
1. Restricted subnet must not have access to internet
2. All images deployed on GKE must come from GCR or Artifacts registry.
The VM must be private.
4. Deployment must be exposed to public internet with a public HTTP load balancer.
5. Allintra is to be created on SCP using terratorm
6. Deployment on GKE can be done by terraform or manually by kubecti tool.
7. The code to be build/dockerized and pushed to GCR is on here:
https://github.com/atethares/DevOps-Challenge-Demo-Code
8. Don't use default compute service account while creating the gke cluster, create custom SA and attach it to your nodes.
9. Only the management subnet can connect to the gke cluster.


# Run Project 
1 - Run infrastructure using terraform 
  terrafrom inint 
  terraform plan
	terraform apply
	
	<img width="1440" alt="Screenshot 2023-02-09 at 10 02 41 PM" src="https://user-images.githubusercontent.com/43528941/217924661-ceab5007-2328-4e13-88b9-9ec3927fa721.png">
