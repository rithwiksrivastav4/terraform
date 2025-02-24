variable "resource_group_name" {
  type        = string
  description = "Enter the resource group name"
}

variable "region" {
  type        = string
  description = "Enter the region"
}

variable "aks_info" {
  type = object({
    name       = string
    node_count = optional(number, 1)
    node_size  = optional(string, "Standard_B2ms")
  })
  description = "aks cluster info"

}

variable "build_id" {
  type    = string
  default = "1"
}