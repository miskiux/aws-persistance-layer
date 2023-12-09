variable "config" {

}

variable "sg_id" {

}

variable "efs_access_point" {
  description = "Determine the access point"
  type        = string
  default     = "/efs-access"
}
