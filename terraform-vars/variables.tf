variable "ec2_name" {
  default = "azat-ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

# variable "ec2_ami" {
#   default = "ami-0742b4e673072066f"
# }

variable "key" {
  default = "demo"
}

variable "s3_bucket_name" {
  # default = "azat-s3-bucket-variable-addwhateveryouwant"
}

variable "ec2_ami" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.ec2_ami) > 4 && substr(var.ec2_ami, 0, 4) == "ami-"  # substr(string, offset, length)    > substr("hello world", 1, 4) > ello
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
