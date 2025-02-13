variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "db_info" {
  type = object({
    engine            = optional(string, "mysql")
    public            = optional(bool, "false")
    username          = optional(string, "devops")
    password          = optional(string, "terrformdevops")
    instance_class    = optional(string, "db.t3.micro")
    allocated_storage = optional(number, "20")
  })
}