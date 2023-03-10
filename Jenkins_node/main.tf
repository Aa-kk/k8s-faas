terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.0.0"
        }
    }   
}

provider "aws" {
    region = var.aws_region
    default_tags {
        tags = {
            Key = "ita_group"
            Value = "Wr-36"
        }
    }
}

module "vpc" {
    source = "./modules/vpc"

    vpc_cidr_block = var.vpc_cidr_block
    public_subnet_cidr_block = var.public_subnet_cidr_block
}

module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
}

module "jenkins_node_role" {
    source = "./modules/role"
    
}

module "ec2_instance" {
    source = "./modules/compute"
    security_group = module.security_group.sg_id
    public_subnet = module.vpc.public_subnet_id
    jenkins_role = module.jenkins_node_role.role_id
    ami_id = var.ami_id
}