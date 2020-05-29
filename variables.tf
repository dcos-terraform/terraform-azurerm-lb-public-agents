variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "resource_group_name" {
  description = "Name of the azure resource group"
}

variable "instance_nic_ids" {
  description = "List of instance nic ids created by this module"
  type        = list(string)
}

variable "location" {
  description = "Azure Region"
}

variable "tags" {
  description = "Add custom tags to all resources"
  type        = map(string)
  default     = {}
}

variable "additional_rules" {
  description = "List of additional rules"
  default     = []
}

variable "num" {
  description = "How many instances should be created"
}

variable "name_prefix" {
  description = "Name Prefix"
  default     = ""
}

