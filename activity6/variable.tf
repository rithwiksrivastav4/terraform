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

variable "route" {
  type        = string
  default     = "0.0.0.0/0"
  description = "route table cidr"
}

variable "subnet_cidrs" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24"]
  description = "subnets cidrs blocks"
}
variable "azs" {
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
  description = "subnets availability zones"
}

variable "subnet_names" {
  type        = list(string)
  default     = ["private-sub", "public-sub"]
  description = "subnet names"
}

variable "vpc_name" {
  type        = string
  default     = "ntire"
  description = "vpc name"
}
variable "igwn" {
  type        = string
  default     = "ntire-igw"
  description = "internet gateway name"
}

variable "rtn" {
  type    = list(string)
  default = ["ntire-private", "ntire-public"]
}