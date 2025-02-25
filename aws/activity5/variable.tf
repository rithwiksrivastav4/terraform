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
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
    }))
  })

}

variable "db_security_group" {
  type = object({
    name = optional(string, "db-sg")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
    }))
  })
}

variable "key_pair_path" {
  type = object({
    name             = optional(string, "mykeypair")
    public_key_path  = optional(string, "~/.ssh/id_rsaa.pub")
    private_key_path = optional(string, "~/.ssh/id_rsaa")
  })
}

variable "web_server" {
  type = object({
    name = string
    ami_filter = object({
      name  = optional(string, "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250115")
      owner = optional(string, "099720109477")
    })
    instance_type               = optional(string, "t2.micro")
    associate_public_ip_address = optional(bool, "true")
    username                    = optional(string, "ubuntu")
  })
}
variable "build_id" {
  type    = string
  default = "1"
}

variable "tags" {
  type    = string
  default = "v1.0.0"
}