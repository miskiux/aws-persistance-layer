variable "private_subnet_ids" {

}

variable "allow_nfs" {

}

variable "allow_all_egress" {

}

variable "access_point" {
  description = "Determine the access point"
  type        = string
  default     = "/access"
}
