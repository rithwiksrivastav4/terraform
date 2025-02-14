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

default= [
  {
    name = "web-1"
    cidr = "10.10.2.0/24"
    az   = "ap-south-1a"
    }, {
    name = "app-1"
    cidr = "10.10.3.0/24"
    az   = "ap-south-1b"
  }
]
}

variable "private_subnets" {
  type = list(object({
    name = string
    az   = string
    cidr = string
  }))
  description = "private subnets"
    default = [ {
     name = "private-sub-1"
    cidr = "10.10.0.0/24"
    az   = "ap-south-1a" 
    }, {
    name = "private-sub-2"
    cidr = "10.10.1.0/24"
    az   = "ap-south-1b"
  } ] 
}
  