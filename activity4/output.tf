output "vpc_id" {
  value       = aws_vpc.net.id
  description = "this is vpc id"
}

output "vpc_cidr" {
  value       = var.vpc_cidr
  description = "this is vpc cidr"
}

output "subnet_cidrs" {
  value       = var.subnet_cidrs
  description = "this is subnets cidr"
}