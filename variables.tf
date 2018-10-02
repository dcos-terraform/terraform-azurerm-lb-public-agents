variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "resource_group_name" {
  description = "resource group name"
}

variable "location" {
  description = "Azure location"
}

variable "tags" {
  description = "Add custom tags to all resources"
  type        = "map"
  default     = {}
}

variable "additional_rules" {
  description = "List of additional rules"
  default     = []
}
