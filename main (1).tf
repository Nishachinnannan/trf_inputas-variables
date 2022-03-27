provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAYDYWNJNGS2YNELGC"
  secret_key = "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"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = 1
  ami_id        = ""
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}