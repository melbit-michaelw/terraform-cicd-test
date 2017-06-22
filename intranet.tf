provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "my_vpc" {
  source = "git::https://github.com/melbit-michaelw/base-vpc.git?ref=0.0.1"
  num_azs = 3
  nat_gw = 0
  name = "${var.name} ${var.env}"
  env = "${var.env}"
}

resource "aws_instance" "web" {
  
  # subnet ID for our VPC
  subnet_id = "${module.my_vpc.public_subnets[0]}"
  # the instance type we want, comes from rundeck
  instance_type = "t2.micro"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "ami-fedafc9d"

  # The name of our SSH keypair you've created and downloaded
  # from the AWS console.
  #
  # https://console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs:
  #
  key_name = "test-aws45"


  # We set the name as a tag
  tags {
    "Name" = "${var.name} ${var.env} Instance"
  }
}

