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


variable "web_security_group" {
  type = object({
    name = optional(string, "web-sg")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = optional(number, "22")
      to_port     = optional(number, "22")
      ip_protocol = optional(string, "tcp")
    }))
  })

}

variable "db_security_group" {
  type = object({
    name = optional(string, "db-sg")
    rules = list(object({
      cidr_ipv4   = optional(string, "10.10.0.0/16")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "all")
    }))
  })
}

variable "key_pair_path" {
  type = object({
    name             = optional(string, "mykeypair")
    public_key_path  = optional(string, "C:/Users/rithwik/.ssh/id_rsa).pub")
    private_key_path = optional(string, "C:/Users/rithwik/.ssh/id_rsa)")
  })
}