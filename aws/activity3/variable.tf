variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "this is region"

}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "this is vpc_cidr"
}

variable "subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "subnet cidrs"
}
variable "azs" {
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1a", "ap-south-1b"]
  description = "availability zone "
}