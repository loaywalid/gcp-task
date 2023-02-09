module "myvpc" {
    source = "./vpc"
    vpc-name = "tfvpc"
    subnet-name1 = "managmentsubnet"
    subnet-name2 = "restrictedsubnet"

}

module "firewall" {
    source = "./firewall"
    firewall-name = "tf-firewall"
    firewall-network = module.myvpc.vpc-id
    protocol = "tcp"
    port = ["22"]
    source_ranges = ["0.0.0.0/0"]
    direction = "INGRESS"
}

module "natgateway" {
    source = "./natgateway"
    nat-name = "tf-nat"
    region-name = "us-central1"
    subnet-name = module.myvpc.subnet-name
    router-region = "us-central1"
    router-network = module.myvpc.vpc-id
}


module "private-instance" {
  source = "./instance"
  instance-name = "tf-instance"
  instance-type = "f1-micro"
  zone = "us-central1-b"
  image = "ubuntu-os-cloud/ubuntu-2204-lts"
  subnet-id = module.myvpc.subnet-name
    
}


module "cluster" {
  source = "./cluster"
  vpc-name= module.myvpc.vpc-id
  subnet-name= module.myvpc.restricted-subnet
}








# module "subnet-1" {
#     source = "./vpc"
#     subnet-name = "managmentsubnet"
#     subnet-cidr = "10.0.0.0/24"
#     region = "us-central1"
#     network = module.myvpc.vpc-id
# }

# module "subnet-2" {
#     source = "./vpc"
#     subnet-name = "restrictedsubnet"
#     subnet-cidr = "10.1.0.0/24"
#     region = "us-central1"
#     network = module.myvpc.vpc-id

# }

