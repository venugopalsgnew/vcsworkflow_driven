terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider   testing   for statefile s3 testing - for testing  .
provider "aws" {
  region = "ap-south-1"
  access_key =  var.accesskey
  secret_key =  var.secretkey
}

resource "aws_instance" "web2" {
  ami           = var.image
  instance_type = var.instancetype

  tags = {
    Name = "HelloWorld3"
  }
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "tfvars-nonprod-bucket"
    key            = "global/nonprod/terraform.tfstate"
    region         = "ap-south-1" 
  }
}

#Testing - testing backend
