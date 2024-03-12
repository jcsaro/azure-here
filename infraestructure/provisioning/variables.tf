variable "vnet_location" {
  type        = string
  description = "The location of the vnet to create."
  nullable    = false
}
variable "use_for_each" {
  type        = bool
  description = "Use `for_each` instead of `count` to create multiple resource instances."
  nullable    = false
}

variable "short_company" {
  type        = string
  description = "Short Name for Company"
  default     = "OX"
}
variable "short_cloud" {
  type        = string
  description = "Short Name for Cloud Environment"
  default     = "Z"
}
variable "short_env" {
  type        = string
  description = "Short Name for Cloud Environment"
  default     = "D"
}

variable "short_project" {
  type        = string
  description = "Short Name for Cloud Environment"
  default     = "OXH"
}
variable "environment" {
  description = "AMBIENTE"
  type        = string
}

variable "location" {
  description = "Location Resource Name"

}
variable "subnet_name1" {
  description = "subnet1"

}
variable "subnet_name2" {
  description = "subnet2"

}
variable "subnet_name3" {
  description = "subnet3"

}