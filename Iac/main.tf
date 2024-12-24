terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }

  backend "s3" {
    bucket = "s3-bucket-ap-southeast-2-maneiro"
    key    = "state/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
  profile = "default"
}

provider "aws" {
  alias   = "ap-southeast-2"
  region  = "ap-southeast-2"
  profile = "default"
}

resource "aws_instance" "aws-ec2-maneira" {
  provider  = aws.us-east-1
  user_data = file("script.sh")

  instance_type = "t2.micro"
  ami           = "ami-0e2c8caa4b6378d8c"

  tags = {
    Iac  = "True"
    Name = "Maneira 1"
  }
}


