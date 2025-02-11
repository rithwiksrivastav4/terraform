variable "vnet_name" {
  type        = string
  default     = "nitre"
  description = "virtual network name"

}

variable "resource_group_name" {
  type        = string
  default     = "terraform"
  description = "resource group name"
}

variable "subnet_names" {
  type        = list(string)
  default     = ["web", "app-1", "app-2", "db"]
  description = "subnets names"
}

variable "vnet_cidr" {
  type = string

  description = "virtual network cidr block"

}

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "resource group location"
}

variable "subnets_cidr" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", ]
  description = "subnets cidrs"
}
