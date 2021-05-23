variable "resource_group_name" {
  type = string
}

variable "app_name" {
  type = string
  default = ""
}

variable "create_new_resource_group" {
  type    = bool
  default = false
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
  type = map
  default = {}
}