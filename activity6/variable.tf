variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "this is region"

}
variable "vpc_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "vpc cidr range"
}


variable "network_name" {
  type        = string
  default     = "ntire"
  description = "vpc name"
}


variable "public_subnets" {
  type = list(object({
    name = string
    az   = string
    cidr = string
  }))
  description = "public subnets"
}

variable "private_subnets" {
  type = list(object({
    name = string
    az   = string
    cidr = string
  }))
  description = "private subnets"
}
