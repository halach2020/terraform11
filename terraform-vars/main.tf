provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.key
  tags = {
    Name = "${var.ec2_name}-instance"
  }
}

resource "aws_s3_bucket" "tf-s3" {
#   bucket = "${var.s3_bucket_name}-${count.index}"
#   count = var.num_of_buckets != 0 ? var.num_of_buckets : 3 # if num_of_buckets is not equal to zero then its value is num_of_buckets else its value is 3
  for_each = toset(var.users)
  bucket   = "${each.value}-dev-bucket-fdsfjsflksjf"
}

resource "aws_s3_bucket" "tf-s3-2" {
  bucket = var.s3_bucket_name2
  tags = {
    Name = "${local.mytag}-come from locals"
  }
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)
  name = each.value
}

# output "tf-example-public_ip" {
#   value = aws_instance.tf-ec2.public_ip
# }

# output "tf_example_private_ip" {
#   value = aws_instance.tf-ec2.private_ip
# }

# output "tf-example-s3" {
#   value = aws_s3_bucket.tf-s3[*] # [for o in var.list : o.id]  using the splat expression it will be  var.list[*].id
# }

# unset ENV_VAR
# terraform plan -var-file="testing.tfvars"


# locals {
#   mytag = "terraform-is-cool"
# }

#Input variables are like function arguments.
#Output values are like function return values.
#Local values are like a function's temporary local variables.



