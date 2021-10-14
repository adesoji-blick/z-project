## ec2 instance/module variables
variable "region" {
  default = "ca-central-1"
}

variable "profile" {
  default = "default"
}

variable "ssh_key" {
  default = "devOps-Project"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ansible_ami_filter" {
  default = "packer-ansible-ami"
  # default = ["packer-ansible-ami"]
}

variable "monitor_ami_filter" {
  default = "packer-prometheus-ami"
  # default = ["packer-ansible-ami"]
}

variable "server_ami_filter" {
  default = "packer-server-ami"
  # default = ["packer-jenkins2-ami", "packer-jenkins2-ami"]
}

variable "resource_count" {
  default = "1"
}

variable "monitor_count" {
  default = "1"
}

variable "server_count" {
  default = "2"
}

variable "resource_tag_name" {
  default = "ansible server"
}

variable "monitor_tag_name" {
  default = "monitor server"
}

variable "server_tag_name" {
  default = ["web server dev", "web server prod"]
}

variable "resource_environment" {
  default = "project env"
}

variable "monitor_environment" {
  default = "project env"
}


variable "server_environment" {
  default = ["development env", "production env"]
}

variable "resource_role" {
  default = "devops-user"
}

variable "monitor_role" {
  default = "ansible-user"
}

variable "server_role" {
  default = ["ansible-user", "ansible-user"]
}

## security group variables
variable "sg_name" {
  default = "ansible server"
}

variable "sg2_name" {
  default = "web server"
}

variable "sg3_name" {
  default = "monitor server"
}

variable "sg4_name" {
  default = "rds server"
}

variable "httpport" {
  default = "0"
}

variable "httpport1" {
  default = "22"
}

variable "httpport2" {
  default = "80"
}

variable "httpport3" {
  default = "9090"
}

variable "httpport4" {
  default = "3000"
}

variable "httpport5" {
  default = "3306"
}

# variable "port_id" {
#   default = ["80", "80", "8080"]
# }

variable "ingress_protocol" {
  default = "tcp"
}

variable "egress_protocol" {
  default = "-1"
}

variable "sg_cidr_block" {
  default = ["0.0.0.0/0"]
}

## VPC, Subnets, Associations variables
variable "vpc_name" {
  default = "z_project_vpc"
}

variable "vpc_id" {
  default = "aws_vpc.z_project_vpc.id"
}

variable "network_instance_count" {
  default = "2"
}

variable "vpc_cidr_block" {
  default = "10.9.0.0/16"
}

variable "subnet_cidr_block" {
  default = ["10.9.0.0/24", "10.9.1.0/24"]
}

variable "private_cidr_block" {
  default = ["10.9.2.0/24", "10.9.3.0/24"]
}

variable "availability_zone" {
  default = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
}

variable "availability_zone2" {
  default = ["ca-central-1b", "ca-central-1d"]
}

variable "map_public_ip" {
  default = "true"
}

variable "rt_cidr_block" {
  default = "0.0.0.0/0"
}

variable "db_password" {
  default = "devops"
}