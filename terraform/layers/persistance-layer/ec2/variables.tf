variable "private_subnet_ids" {

}

variable "allow_all_egress" {

}

variable "allow_ssh" {

}


variable "file_system_id" {

}


variable "instance_type" {
  description = "Name of the project"
  type        = string
  default     = "t2.micro"
}

variable "aws_ami" {
  description = "Instance configuration"
  type        = string
  default     = "ami-0669b163befffbdfc"
}
