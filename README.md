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

 	
	terrafrom init 
  
  	terraform plan
	
	terraform apply
	
<img width="1440" alt="Screenshot 2023-02-09 at 10 02 41 PM" src="https://user-images.githubusercontent.com/43528941/217925334-7053eb10-86b8-4740-b19e-52832fead226.png">


2- Clone repo  https://github.com/atefhares/DevOps-Challenge-Demo-Code 

	build image 
	
	push the image to GCR
	

run these commands:

	docker build -t gcp-python 
	docker tag gcp-python gcr.io/loayproject/gcp-python
	docker push gcr.io/loayproject/gcp-python


3- pull redis image from dockerhub and push it to your GCR 

		docker pull redis
		
	        docker tag redis gcr.io/loayproject/project-redis
		
	        docker push gcr.io/loayproject/project-redis:latest
		
		
4- SSH into private vm to 

 		create the K8S file that's needed and apply it using kubectl 
		

5- accesing the python application 


<img width="1398" alt="Screenshot 2023-02-09 at 10 23 21 PM" src="https://user-images.githubusercontent.com/43528941/217928775-e6336032-e4aa-48a5-896f-dcdfb8acdcf0.png">






	
	
